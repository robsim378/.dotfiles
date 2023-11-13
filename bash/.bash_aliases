##### General Commands #####
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -a'

##### Brightness #####
alias brightness_max='echo 7500 > /sys/class/backlight/intel_backlight/brightness'

function brightness {
	brightness_percent=$(echo $1/100 | bc -l)
	new_brightness=$(echo $brightness_percent*7500 | bc -l)
	echo ${new_brightness%.*} > /sys/class/backlight/intel_backlight/brightness
}

##### Displays #####
alias displayconfig='arandr'

##### Audio #####
alias audioconfig='pavucontrol'

##### vim to nvim #####
alias vim='nvim'

##### Bluetooth #####
#alias bluetoothctl='bluetoothconfig'

##### Image Viewing #####
alias feh='feh -F'

function preview {
	if [ $# -eq 1 ]; then
		kitty +kitten icat $1
	fi
	if [ $# -eq 0 ]; then
		feh -i
	fi
}

##### Carleton University VPN #####
alias cuconnect='OPENSSL_CONF=$HOME/.config/openssl/openssl.conf openconnect-sso --server cuvpn.carleton.ca/mfa'

alias lanebox='ssh -p 20002 lane@avp-1.sce.carleton.ca'

##### Networking Replacements #####
alias netconfig='printf "netlist: display networks\nnetconnect [SSID] [Password]: connect to network\nnetdelete [SSID]: delete connection\n"'
alias networkconfig='netconfig'

alias netlist='nmcli device wifi list'
alias netgui='nm-connection-editor'

function netconnect {
	if [ $# -eq 1 ]; then
		nmcli device wifi connect $1
	fi
	if [ $# -eq 2 ]; then
		nmcli device wifi connect $1 password $2
	fi
}

function netdelete {
	nmcli connection delete $1
}
