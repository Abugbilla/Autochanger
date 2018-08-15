get_environment() {
	desktop=${DESKTOP_SESSION,,}
	if [[ $desktop =~ ^(gnome|unity|cinnamon|pantheon|budgie|gnome-classic)$ ]]; then
		echo $desktop

	elif [[ $desktop =~ ^ubuntu-communitheme-snap ]]; then
		echo $desktop

	elif [[ $desktop =~ ^ubuntu ]]; then
		echo unity

	elif [[ $desktop =~ ^xubuntu ]] || [[ $desktop =~ ^xfce ]] || [[ $desktop =~ ^xfce4 ]]; then
		echo xfce4

	elif [[ $desktop =~ ^lubuntu ]] || [[ $desktop =~ ^lxde ]]; then
		echo lxde

	elif [[ $dekstop =~ ^kubuntu ]] || [[ $desktop =~ ^kde ]] || [[ $desktop =~ ^plasma ]]; then
		echo kde

	elif [[ $desktop =~ ^mate ]]; then
		echo mate
	fi
}


set_background() {
	environment=$(get_environment)
	samples=(gnome pantheon budgie gnome-classic)
	case "${environment}" in
		samples)
		gsettings set org.gnome.desktop.background picture-uri file://$1
		# you can uncomment line 34 to set the image style as zoom.
		# gsettings set org.gnome.destkop.background picture-options zoom
		;;

		ubuntu-communitheme-snap)
		# gsettings set org.gnome.desktop.background draw-background false
		/usr/bin/gsettings set org.gnome.desktop.background picture-uri file://$1
		# You can uncomment line 40 to set the image style as zoom.
		# gsettings set org.gnome.desktop.background picture-options zoom
		# gsettings set org.gnome.desktop.background draw-background true
		;;

		unity)
		gsettings set org.gnome.desktop.background draw-background false
		gsettings set org.gnome.desktop.background picture-uri file://$1
		gsettings set org.gnome.desktop.background picture-options zoom
		gsettings set org.gnome.desktop.background draw-background true
		;;

		mate)
		gsettings set org.mate.desktop.background picture-filename $1
		;;

		cinnamon)
		gsettings set org.cinnamon.desktop.background picture-uri file://$1
		;;

		lxde)
		pcmanfm --set-wallpaper $1 --wallpaper-mode=fit
		;;

		xfce4)
		xconf-query -c xfce4-desktop -p $xfce_desktop_prop_prefix/workspace1/last-image -s $1 # this sets image for one workspace
		xconf-query -c xfce4-desktop -p $xfce_desktop_prop_prefix/workspace1/image-style -s 5 # this sets image in zoom mode
		;;

		*)
		echo "The environment does not exist" >&2
		;;
	esac
}


display() {
	if [ $# -ne 2 ]; then
		echo "cannot execute: check argument size" >&2
	elif [ $# -eq 2 ]; then
		local arg=$1
		if [ -d $arg ]; then
			while true; do
				for image in $arg/*; do
					set_background "${image}"
						sleep $2
					done
				done
		else
			echo "$1 does not exist"
		fi
	fi
}

display ${1} ${2}
