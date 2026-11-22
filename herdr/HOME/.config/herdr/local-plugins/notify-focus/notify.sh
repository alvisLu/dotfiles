#!/bin/bash
# Posts a macOS notification when an agent is done or blocked.
# Clicking it brings the terminal forward and focuses that agent's pane.
set -u

# Used for the click when no herdr client is attached and none was seen before.
DEFAULT_TERMINAL_BUNDLE_ID="dev.herdr.app"
DELAY_SECONDS=1

herdr="${HERDR_BIN_PATH:-herdr}"
notifier="$(command -v terminal-notifier || echo /opt/homebrew/bin/terminal-notifier)"
jq="$(command -v jq || echo /usr/bin/jq)"
state_dir="${HERDR_PLUGIN_STATE_DIR:-}"

# Bundle id of the app a process runs under, found by walking up its parents.
terminal_of() {
  local pid=$1 comm
  while [ "${pid:-1}" -gt 1 ]; do
    comm=$(ps -o comm= -p "$pid") || return
    case "$comm" in
      */herdr-core) echo "dev.herdr.app"; return ;;
      */iTerm2/iTermServer*) echo "com.googlecode.iterm2"; return ;;
      *.app/Contents/MacOS/*)
        /usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "${comm%%.app/Contents/MacOS/*}.app/Contents/Info.plist" 2>/dev/null
        return ;;
    esac
    pid=$(ps -o ppid= -p "$pid" | tr -d ' ')
  done
}

# Terminals that have a herdr client attached right now, one per line.
client_terminals() {
  local pid
  for pid in $(ps -axo pid=,args= | awk '$2 ~ /(^|\/)herdr$/ && (NF == 2 || $3 ~ /^-/ || $3 == "session") { print $1 }'); do
    terminal_of "$pid"
  done
}

event="${HERDR_PLUGIN_EVENT_JSON:-}"
[ -n "$event" ] || exit 0
[ -z "$state_dir" ] || printf '%s\n' "$event" > "$state_dir/last-event.json"

pane_id=$("$jq" -r '(.data // .).pane_id // empty' <<<"$event")
status=$("$jq" -r '(.data // .).agent_status // empty' <<<"$event")
[ -n "$pane_id" ] || exit 0

# Events carry no previous status, so remember it per pane.
prev=""
if [ -n "$state_dir" ]; then
  status_file="$state_dir/status-${pane_id//[^A-Za-z0-9_-]/_}"
  prev=$(cat "$status_file" 2>/dev/null)
  printf '%s\n' "$status" > "$status_file"
fi

case "$status" in
  done) verb="完成了" ;;
  # Herdr reports idle instead of done when the agent's tab is focused,
  # even if the terminal window is behind another app.
  idle) [ "$prev" = "working" ] || exit 0; verb="完成了" ;;
  blocked) verb="需要你回應" ;;
  *) exit 0 ;;
esac

# Like Herdr's own toasts: skip short flaps, and skip the pane you are looking at.
sleep "$DELAY_SECONDS"
pane=$("$herdr" pane get "$pane_id" 2>/dev/null | "$jq" -c '.result.pane // empty')
[ -n "$pane" ] || exit 0
case "$status:$("$jq" -r '.agent_status' <<<"$pane")" in
  blocked:blocked | done:done | done:idle | idle:done | idle:idle) ;;
  *) exit 0 ;;
esac

# Herdr keeps a focused pane even when no client is attached or its window is
# behind another app, so only skip when a herdr client's terminal is frontmost.
terminals=$(client_terminals)
front=$(lsappinfo info -only bundleid "$(lsappinfo front)" 2>/dev/null | cut -d'"' -f4)
if [ "$("$jq" -r '.focused' <<<"$pane")" = "true" ] && [ -n "$front" ] && grep -qxF "$front" <<<"$terminals"; then
  exit 0
fi

terminal=$(head -n 1 <<<"$terminals")
if [ -n "$state_dir" ]; then
  if [ -n "$terminal" ]; then
    printf '%s\n' "$terminal" > "$state_dir/terminal"
  else
    terminal=$(cat "$state_dir/terminal" 2>/dev/null)
  fi
fi
terminal="${terminal:-$DEFAULT_TERMINAL_BUNDLE_ID}"

agent=$("$jq" -r '(.data // .) | (.display_agent // .agent // "agent") | (.[:1] | ascii_upcase) + .[1:]' <<<"$event")
pane_title=$("$jq" -r '.terminal_title_stripped // empty' <<<"$pane")
workspace_id=$("$jq" -r '.workspace_id' <<<"$pane")
workspace=$("$herdr" workspace get "$workspace_id" 2>/dev/null | "$jq" -r '.result.workspace.label // empty')
message="${workspace:-$workspace_id}${pane_title:+ · $pane_title}"

click="/usr/bin/open -b '$terminal'; HERDR_SOCKET_PATH='${HERDR_SOCKET_PATH:-}' '$herdr' agent focus '$pane_id'"
[ -n "${HERDR_SOCKET_PATH:-}" ] || click="/usr/bin/open -b '$terminal'; '$herdr' agent focus '$pane_id'"

"$notifier" \
  -title "$agent $verb" \
  -message "$message" \
  -group "herdr-$pane_id" \
  -activate "$terminal" \
  -execute "$click" >/dev/null
