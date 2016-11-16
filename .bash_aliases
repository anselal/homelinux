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
alias dumax='du -h --max-depth=1 2> /dev/null | sort -n -r | head -n20'

# Upgrade
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get clean'
alias upgrade-fast='sudo apt-fast update && sudo apt-fast upgrade -y'
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
