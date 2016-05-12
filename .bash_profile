#
# ~/.bash_profile
#
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


time=$(cat /proc/uptime | awk '{print $1;}')

if [ ${#time} -le 4 ] && [ ${time:0:1} == "1"]
then
    startx
else
    screenfetch -E -t
fi
