##### General Commands #####
alias ls='ls --color=auto'

##### Displays #####
alias displayconfig='arandr'

##### Audio #####
alias audioconfig='pavucontrol'

##### Bluetooth #####
alias bluetoothctl='bluetoothconfig'

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
alias cuconnect='sudo openconnect cuvpn.carleton.ca'

##### Networking Replacements #####
alias netconfig='printf "netlist: display networks\nnetconnect [SSID] [Password]: connect to network\nnetdelete [SSID]: delete connection\n"'
alias networkconfig='netconfig'

alias netlist='nmcli device wifi list'

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
