#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


PS1='[\u@\h \W]\$ '

ros2_start(){
	source /opt/ros/humble/setup.bash
	source /home/robert/projects/joint_state_publishers/install/setup.bash
}

hexapod_start(){
	cd /home/robert/projects/hexapod
	source install/setup.bash
}
