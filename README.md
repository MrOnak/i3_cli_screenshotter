# i3_cli_screenshotter
a shellscript that takes screenshots and stores them as jpg.

this one is heavily inspired by a discussion on stackexchange.com:
https://unix.stackexchange.com/questions/233345/how-can-i-easily-make-screenshots-of-screen-regions-on-arch-linux-with-i3-wm

I'm running this inside the i3 window manager, you will have to adapt it if
you're running anything else, since I'm calling i3-msg

The script was written for personal use. Feel free to copy it and adapt it but
chances that I maintain a more generic solution are slim to non-existant.

## requirements
`import` from imagemagick
`jq` command-line json parser
`xclip` X clipboard tool

## installation
* I have cloned this repository to `~/.local/bin/screenshotter`
* `ln -s ~/.local/bin/screenshotter/screenshotter.sh ~/.local/bin/screenshotter.sh`

## i3 integration
Tweak your keyboard shortcuts to your own needs, but these are mine

```
bindsym --release Print exec --no-startup-id screenshotter.sh area
bindsym --release Ctrl+Print exec --no-startup-id screenshotter.sh window
```
