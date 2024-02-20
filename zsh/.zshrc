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

export PATH=$PATH:/home/robert/bin

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Home key
bindkey	"^[[H"	beginning-of-line
# CTRL+A
bindkey	"^A"	beginning-of-line
# End key
bindkey	"^[[F"	end-of-line
# CTRL+B
bindkey	"^B"	end-of-line
# Delete key
bindkey	"^[[3~"	delete-char

source $HOME/.aliases
# Set LS_COLORS environment variable, it's required for zsh suggestions to be colored.
source $HOME/.config/colors/ls_colors

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

zmodload zsh/complist
source /home/robert/.config/zsh/completion.zsh


eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Show the APOD
apod -ti
echo
# cat ~/bin/apod_scraper_results/description.txt
