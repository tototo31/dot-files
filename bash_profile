[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

if [ -f $HOME/.bashrc ]
then
	source $HOME/.bashrc
fi

THEME=$HOME/.theme
PROMPT_COMMAND="" # have this call a script that checks if the background is correct between terminals

dotfiles=$HOME/dot-files

#Sync theme color
#assume solarized dark is default
if [ -f $THEME ]
then
	CURRENT=`cat $THEME`
	if [ $CURRENT == "dark" ]
	then
		osascript ~/.changeColor.scpt "Solarized Dark ansi"
	else
		osascript ~/.changeColor.scpt "Solarized Light ansi"
	fi
else
	touch $THEME
	echo dark > $THEME
fi

#Custom Alias definitions
alias ls='ls -G' 
alias dark='osascript ~/.changeColor.scpt "Solarized Dark ansi"; echo dark > $THEME'
alias light='osascript ~/.changeColor.scpt "Solarized Light ansi"; echo light > $THEME' 
alias l='light'
alias d='dark'
alias toggleTheme='source $dotfiles/scripts/togglebg.sh'
alias t='toggleTheme'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

