# This is the custom theme template for gitprompt.sh

# These are the defaults from the "Default" theme 
# You just need to override what you want to have changed
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  PathShort="\W";

  GIT_PROMPT_BRANCH="${Cyan}"
  GIT_PROMPT_MASTER_BRANCH="${GIT_PROMPT_BRANCH}"
  GIT_PROMPT_UNTRACKED=" ${Cyan}…${ResetColor}"
  GIT_PROMPT_STAGED="${Red}● "
  GIT_PROMPT_CHANGED="${Yellow}✚ "
  GIT_PROMPT_CLEAN="${BoldBlue}✔"
  GIT_PROMPT_COMMAND_FAIL="${Red}✘"

  GIT_PROMPT_START_USER="${BoldMagenta}${PathShort}${BoldYellow}⚡${ResetColor}"
  GIT_PROMPT_START_ROOT="${BoldMagenta}${PathShort}${BoldYellow}⚡${ResetColor}"

  GIT_PROMPT_END_USER="\n${BoldGreen}> ${ResetColor}"
  GIT_PROMPT_END_ROOT="\n # ${ResetColor}"


}

reload_git_prompt_colors "Custom"
