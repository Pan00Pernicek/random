#!/bin/bash
[[ $- != *i* ]] && return
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export EDITOR="emacs"
export QT_QPA_PLATFORMTHEME=kvantum
export QT_STYLE_OVERRIDE=kvantum
alias ls='ls --color=auto'
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	if test -z "${XDG_RUNTIME_DIR}"; then
	    export XDG_RUNTIME_DIR="/tmp/$(id -u)-sway"
	    if ! test -d "${XDG_RUNTIME_DIR}"; then
	        mkdir "${XDG_RUNTIME_DIR}"
	        chmod 0700 "${XDG_RUNTIME_DIR}"
	    fi
	fi
	exec sway
fi
ex() {
	execlineb $@
}
e() {
	execlineb -c "$@"
}
cpuboost() {
	doas sh -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'
}
nosus() {
	doas sv down acpid
}
yessus() {
	doas sv up acpid
}
brlall() {
	for stratum in $(brl list); {
		print "${stratum}:"
		strat "${stratum}" "$@"
	}
}
alias ge='emacs --no-window-system'
#PS1="\033[38;2;0;255;147m\w \$ \033[0;0m"
PS1="\033[38;2;0;255;147m\$ \033[0;0m"
source /bedrock/strata/arch/usr/share/blesh/ble.sh
shopt -u globstar
