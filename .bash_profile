#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set MANPATH so it includes user's private man if it exists
if [ -d "$HOME/man" ] ; then
    MANPATH="$HOME/man:$MANPATH"
fi

# set LD_LIBRARY_PATH so it includes user's private lib if it exists
if [ -d "$HOME/lib" ] ; then
    LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH
fi


screenfetch -E -t
