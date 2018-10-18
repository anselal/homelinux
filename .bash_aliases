# Default linux aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -al --color=auto'
alias ll='ls -l --color=auto'
alias xl='tailf ~/.kodi/temp/kodi.log'
alias xll='less ~/.kodi/temp/kodi.log'
alias xlll='while :; do tailf ~/.kodi/temp/kodi.log; done'

# Custom aliases
alias kairos='curl http://wttr.in/thessaloniki'
alias dumax='du -h --max-depth=1 2> /dev/null | sort -h -r | head -n20'
alias rmempty='find . -type d -empty -delete'
alias octal="stat -c '%a %n'"
# Usage octal * (for all files)
#       octal hello.txt (for a specific file)

# Folder shortcuts
alias down='cd ~/Downloads'
alias antmon='cd ~/Projects/github/anselal/antminer-monitor'
alias homelinux='cd ~/Projects/github/anselal/homelinux'

# Upgrade
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get clean'
alias upgrade-fast='sudo apt-fast update && sudo apt-fast upgrade -y'
alias upgrade-kernel='sudo zypper dist-upgrade -r kernel-repo'
alias pip_upgrade='pip list --outdated | sed "s/(.*//g" | xargs pip install -U'

# Flex
alias flex='flexget execute --tasks SHOWRSS move_tvshows --now'
alias flexmove='flexget execute --tasks move_tvshows --now'

# RPi
alias rpi_getmem='vcgencmd get_mem arm && vcgencmd get_mem gpu'
alias rpi_gettemp='vcgencmd measure_temp'
alias rpi_getclock='for src in arm core h264 isp v3d uart pwm emmc pixel vec hdmi dpi ; do echo -e "$src:\t$(vcgencmd measure_clock $src)" ; done'
alias rpi_getvolts='for id in core sdram_c sdram_i sdram_p ; do echo -e "$id:\t$(vcgencmd measure_volts $id)" ; done'
alias rpi_getcodec='for codec in H264 MPG2 WVC1 MPG4 MJPG WMV9 ; do echo -e "$codec:\t$(vcgencmd codec_enabled $codec)" ; done'

# Docker aliases
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# Networking
alias openports='sudo netstat -tulp' # optionally pass -n
alias openconnections='sudo netstat -tupn'

# xrandr
alias vga='xrandr --auto --output VGA-1 --mode 1920x1080 --right-of LVDS-1'
alias dp='xrandr --auto --output DP-1 --mode 1920x1080 --right-of LVDS-1'

function rpi_info() {
  echo ""
  echo "=======";
  echo "Memory";
  echo "=======";
  rpi_getmem
  echo ""
  echo "============";
  echo "Temperature";
  echo "============";
  rpi_gettemp
  echo ""
  echo "======";
  echo "Clock";
  echo "======";
  rpi_getclock
  echo ""
  echo "=======";
  echo "Volts";
  echo "=======";
  rpi_getvolts
  echo ""
  echo "=======";
  echo "Codecs";
  echo "=======";
  rpi_getcodec
  echo ""
}

# Easy file sharing from the command line
transfer() {
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi
    tmpfile=$( mktemp -t transferXXX );
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile;
    rm -f $tmpfile;
}
