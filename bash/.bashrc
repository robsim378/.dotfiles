#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/aliases ]; then
	. ~/aliases
fi


# PS1='[\u@\h \W]\$ '
# export PS1="\[\e[32:1m\]\w \[\e[0m\]\n> "

# PROMPT_COMMAND="export PROMPT_COMMAND=echo"

ros2_start(){
	source /opt/ros/humble/setup.bash
	source /home/robert/projects/joint_state_publishers/install/setup.bash
}

hexapod_start(){
	ros2_start
	cd /home/robert/projects/hexapod
	source install/setup.bash
}

eval "$(starship init bash)"
