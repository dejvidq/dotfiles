#!/usr/bin/env bash
function git_info() {
    branch_name="$(__git_ps1 "%s")"
   [ -n "${branch_name}" ] && echo "${cyan}git:(${yellow}${branch_name}${cyan}) " || echo ""
}

function short_path() {
   echo '$(echo $(echo $(dirname \w)|sed -e "s;\(/\.\?.\)[^/]*;\1;g" -e "s;/h/d;~;")/\W | sed -e "s;/h/~;~;" -e "s;///;/;;" -e "s;//;/;")'
}

function prompt_command() {
	PS1="${green}$(short_path) ${cyan}$(git_info)${green}→ ${reset_color}"
}
safe_append_prompt_command prompt_command
