#! /bin/sh
# set wallpaper
feh --bg-scale /home/olialka/Pictures/Wallpapers/tide.jpg

# enable X manager
xcompmgr &

# time
dte() {
    dte="$(date "+%Y-%m-%d | 🕒 %H:%M")"
    echo -e "$dte"
 }

# memory usage
mem() {
    mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 /1024.0}'`
    echo -e "🖪 $mem"
}

# cpu usage
cpu() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 1
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
     echo -e "💻 $cpu% cpu"
}

# display vars
while true; do
    xsetroot -name " $(cpu) | $(mem) | $(dte)"
    sleep 5s # refresh interval
done &

exec /usr/local/bin/dwm
