# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/nvim
#export EDITOR=/usr/bin/mcedit
export BROWSER=google-chrome-beta

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true
#set a full block non blinking cursor, color red. 
#PROMPT_COMMAND='echo -e "\e[?16;0;64c"'


##############
# pretty prompt and font colors
##############

# alter the default colors to make them a bit prettier
#echo -en "\e]P0000000" #black
#echo -en "\e]P1D75F5F" #darkred
#echo -en "\e]P287AF5F" #darkgreen
#echo -en "\e]P3D7AF87" #brown
#echo -en "\e]P48787AF" #darkblue
#echo -en "\e]P5BD53A5" #darkmagenta
#echo -en "\e]P65FAFAF" #darkcyan
#echo -en "\e]P7E5E5E5" #lightgrey
#echo -en "\e]P82B2B2B" #darkgrey
#echo -en "\e]P9E33636" #red
#echo -en "\e]PA98E34D" #green
#echo -en "\e]PBFFD75F" #yellow
#echo -en "\e]PC7373C9" #blue
#echo -en "\e]PDD633B2" #magenta
#echo -en "\e]PE44C9C9" #cyan
#echo -en "\e]PFFFFFFF" #white
#clear #for background artifacting

# set the default text color. this only works in tty (eg $TERM == "linux"), not pts (eg $TERM == "xterm")
#setterm -background black -foreground green -store

# http://linuxgazette.net/137/anonymous.html
cursor_style_default=0 # hardware cursor (blinking)
cursor_style_invisible=1 # hardware cursor (blinking)
cursor_style_underscore=2 # hardware cursor (blinking)
cursor_style_lower_third=3 # hardware cursor (blinking)
cursor_style_lower_half=4 # hardware cursor (blinking)
cursor_style_two_thirds=5 # hardware cursor (blinking)
cursor_style_full_block_blinking=6 # hardware cursor (blinking)
cursor_style_full_block=16 # software cursor (non-blinking)

cursor_background_black=0 # same color 0-15 and 128-infinity
cursor_background_blue=16 # same color 16-31
cursor_background_green=32 # same color 32-47
cursor_background_cyan=48 # same color 48-63
cursor_background_red=64 # same color 64-79
cursor_background_magenta=80 # same color 80-95
cursor_background_yellow=96 # same color 96-111
cursor_background_white=112 # same color 112-127

cursor_foreground_default=0 # same color as the other terminal text
cursor_foreground_cyan=1
cursor_foreground_black=2
cursor_foreground_grey=3
cursor_foreground_lightyellow=4
cursor_foreground_white=5
cursor_foreground_lightred=6
cursor_foreground_magenta=7
cursor_foreground_green=8
cursor_foreground_darkgreen=9
cursor_foreground_darkblue=10
cursor_foreground_purple=11
cursor_foreground_yellow=12
cursor_foreground_white=13
cursor_foreground_red=14
cursor_foreground_pink=15

#cursor_styles="\e[?${cursor_style_full_block};${cursor_foreground_black};${cursor_background_red};c" # only seems to work in tty
cursor_styles="\[\e[?${cursor_style_full_block};${cursor_foreground_black};${cursor_background_red};c\]" # only seems to work in tty

# http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html
prompt_foreground_black=30
prompt_foreground_red=31
prompt_foreground_green=32
prompt_foreground_yellow=33
prompt_foreground_blue=34
prompt_foreground_magenta=35
prompt_foreground_cyan=36
prompt_foreground_white=37

prompt_background_black=40
prompt_background_red=41
prompt_background_green=42
prompt_background_yellow=43
prompt_background_blue=44
prompt_background_magenta=45
prompt_background_cyan=46
prompt_background_white=47

prompt_chars_normal=0
prompt_chars_bold=1
prompt_chars_underlined=4 # doesn't seem to work in tty
prompt_chars_blinking=5 # doesn't seem to work in tty
prompt_chars_reverse=7

prompt_reset=0

#start_prompt_coloring="\e[${prompt_chars_bold};${prompt_foreground_black};${prompt_background_green}m"

#start_prompt_styles="\e[${prompt_chars_bold}m" # just use default background and foreground colors
start_prompt_styles="\[\e[${prompt_chars_bold}m\]" # just use default background and foreground colors
#end_prompt_styles="\e[${prompt_reset}m"
end_prompt_styles="\[\e[${prompt_reset}m\]"

#PS1="${start_prompt_styles}[\u@\h \W] \$${end_prompt_styles}${cursor_styles} "

PS1="${start_prompt_styles}[\u@\h \W] \$${end_prompt_styles}${cursor_styles} "

##############
# end pretty prompt and font colors
##############



# Not Sure If I need this. My System seems to not set that var which is supposed
# to be set to $HOME/config by default according to the location of my
# fonts.conf file
# http://www.freedesktop.org/software/fontconfig/fontconfig-user.html
#if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
if [ -z ${XDG_CONFIG_HOME+x} ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

## Adding linuxbrew to the path
#see: https://github.com/Homebrew/linuxbrew#dependencies
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#sudo gpm -m /dev/input/mice -t exps2

#add '~/bin' to PATH.
export PATH="$HOME/bin:$PATH"

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# My Proxy Settings (for Privoxy):
export http_proxy="http://127.0.0.1:8118"
#export https_proxy="https://127.0.0.1:8118"
# I chnaged it because drop_box_uploader didn't work with the https://...
export https_proxy="http://127.0.0.1:8118"
#assignProxy(){
#  PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
#  for envar in $PROXY_ENV
#  do
#    export $envar=$1
#  done
#  for envar in "no_proxy NO_PROXY"
#  do
#     export $envar=$2
#  done
#}
#
#clrProxy(){
#  assignProxy "" # This is what 'unset' does.
#}
#
#myProxy(){
#  user=YourUserName
#  read -p "Password: " -s pass &&  echo -e " "
#  proxy_value="http://$user:$pass@ProxyServerAddress:Port"
#  no_proxy_value="localhost,127.0.0.1,LocalAddress,LocalDomain.com"
#  assignProxy $proxy_value $no_proxy_value
#}
#alias to yaourt because it can't connect to AUR with the privoxy settings
alias yyaourt="https_proxy='' yaourt"
alias ssteam="LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' /usr/bin/steam"
