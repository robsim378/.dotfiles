# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/robert/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


source $HOME/.aliases

ros2_start(){
	source /opt/ros/humble/setup.zsh
	source /home/robert/projects/joint_state_publishers/install/setup.zsh
}

hexapod_start(){
	ros2_start
	cd /home/robert/projects/hexapod
	source install/setup.zsh
}

precmd() {
	precmd() {
		echo
	}
}

eval "$(starship init zsh)"