# -*- shell-script -*-
# Define some functions
wh() {
    which "$1" > /dev/null
}
whe() {
    wh "$1" && "$@"
}
whee() {
    wh "$1" && exec "$@" &
}

systray_applets() {
    whe wmname awesome
    whee nm-applet
    whee wicd-gtk -t
    whee connman-ui-gtk
    whee update-notifier
    whee smart-notifier
    whe xfce4-power-manager || whee fdpowermon
    whee radiotray
    whee amora-applet
    whe clipit || whe parcellite &
    whe xfce4-volumed
    whe qasmixer -t || whe volumeicon || whe volti &
    [ -d $HOME/.yarssr/state ] && [ -n "`find $HOME/.yarssr/state -type f`" ] && whee yarssr
    whee shutter --min_at_startup
    # Use redshift if installed
    whe gtk-redshift -l $LOC || whe redshift -l $LOC &

    # Owncloud and derivatives
    whe owncloud || whe mirall || whe polybox &
}

xsession_per_host() {
    if [ -e $PH/xsession.$HOSTNAME ]; then
	sleep 1
	. $PH/xsession.$HOSTNAME
    elif [ -n "$*" ]; then
        uxterm &
	"$@"
    fi &
}
