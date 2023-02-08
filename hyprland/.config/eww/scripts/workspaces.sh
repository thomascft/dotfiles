#!/bin/sh

ACTIVEWS=$(hyprctl -j monitors | jq ".[0].activeWorkspace.id")
export a"$ACTIVEWS"="active"

function handle_event {
	case ${1%>>*} in
		workspace)
			unset a"$ACTIVEWS"
			ACTIVEWS=${1#*>>}
			export a"$ACTIVEWS"="active"
			create_taglist
			;;
		focusedmon)
			ACTIVEWS=${1#*,}
			;;
		createworkspace)
			local WORKSPACE=${1#*>>}
			export o"$WORKSPACE"="occupied"
			create_taglist
			;;
		destroyworkspace)
			local WORKSPACE=${1#*>>}
			unset o"$WORKSPACE"
			create_taglist
	esac
}

function create_taglist {
	echo "
		(box :orientation \"v\" :class \"workspaces\" :space-evenly \"false\" \
			(button :class \"$o1 $a1\" :halign \"center\") \
			(button :class \"$o2 $a2\" :halign \"center\") \
			(button :class \"$o3 $a3\" :halign \"center\") \
			(button :class \"$o4 $a4\" :halign \"center\") \
			(button :class \"$o5 $a5\" :halign \"center\") \
			(button :class \"$o6 $a6\" :halign \"center\") \
			(button :class \"$o7 $a7\" :halign \"center\") \
			(button :class \"$o8 $a8\" :halign \"center\"))"
}

for NUM in {0..8}; do
	WORKSPACE=$(hyprctl -j workspaces | jq ".[$NUM].id")
	if [[ $WORKSPACE != "null" ]]; then
	export o"$WORKSPACE"="occupied"
	fi
done

create_taglist

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do
handle_event "$event"
done
