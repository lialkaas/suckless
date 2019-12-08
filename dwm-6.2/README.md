# dwm
Installation guide for Fedora 31

### Prerequisites sudo dnf install
```
libX11-devel
libXft-devel
libXinerama-devel
xorg-x11-xinit-session
feh  # wallpaper setter
```

### Edit config.mk
```
-X11INC = /usr/X11R6/include
-X11LIB = /usr/X11R6/lib
+X11INC = /usr/include/X11
+X11LIB = /usr/lib64/X11
```

### Recompile
`sudo make clean install`

### Edit ~/.xinitrc
~~~~
#! /bin/sh
feh -bg-scale /home/olialka/Pictures/Wallpapers/tide.jpg
while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` `uptime |sed
    's/.*,//'`"; sleep 1 ; done &
exec /usr/local/bin/dwm
~~~~

### Make ~/.xinitrc executable
~~~~
ln -s ~/.xinitrc ~/.xsession
chmod 755 ~/.xsession
~~~~
On next login select User Script session

### Create login DM entry for dwm
`sudo vim /usr/share/xsessions/custom-dwm.desktop`
