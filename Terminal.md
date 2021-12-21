# Improving Terminal
Terminal on MacOS is the interface for the [Bourne-Again SHell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)). Here are a few optimisations I recommend:

## iTerm2
[iTerm2](https://iterm2.com) is a complete replacement for Terminal. I use a profile (in Preferences) based on a colour scheme called "OceanicMaterial". To browser other themes see [this site](http://iterm2colorschemes.com). I have also selected "Install Shell Integration" from the iTerm2 menu (for effects of this see below). iTerm can also integrate with [tmux](https://github.com/tmux/tmux/wiki), the next program.

## tmux
I used to use the terminal multiplexer `tmux` (which has the shortcut Ctrl-b). Here is [excellent run through](http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/) of `tmux`. For installation simply type:
```
brew install tmux
```
or for Ubuntu systems:
```
sudo apt install tmux
```
As per the `tmux` guide I linked I also recommend "htop" (an enhanced version of `top`) for system monitoring which can be installed in the same way (substitute `htop` for tmux in the code above).

Update the section below for ZSH, oh-my-zsh and Powerlevel10k installations...

## Adjustments to BASH Profile
Using BASH entails a lot of typing so it is useful to adjust settings to reduce this. This can be achieved by editing a file called ```.bash_profile```. This file can be used to edit environmental variables in BASH (to see these type ```env```) and a particularly common instance is the PATH variable (to see this: ```echo $PATH```) which instructs BASH where to look for the meaning of user input. If you have programs stored in unique folders these folders can be added to the PATH variable for rapid access at the command line.

It is possible to intervene earlier in the construction of the PATH variable. A neat way to postpend folder paths to the PATH variable is [described here for PostgresSQL](http://postgresapp.com/documentation/cli-tools.html) (invoke as ```psql```). As well as this, I've added a single file containing the path for the Julia application to ```/etc/paths.d```:
```
echo /Applications/Julia-1.7.app/Contents/Resources/julia/bin | sudo tee /etc/paths.d/julia
```
Another method is to place softlinks (using ```ln -s```) into ```/usr/local/bin```. However for (ana|mini)conda the installers used to prepend the (e.g.) anaconda folder to the PATH variable. This meant that the conda version of (e.g.) python was invoked before the system version. This is useful for the user, but it was a problem for homebrew (the recipes for which assume a system python installation). An elegant solution for this problem is [described here](https://hashrocket.com/blog/posts/keep-anaconda-from-constricting-your-homebrew-installs), but since conda version 4.4 this is no longer required because conda does not activate its base environment by default. This change has effectively de-conflicted homebrew and conda.

I can show you the contents of ```.bash_profile``` in my home directory (note that ```ls -a``` is required to detect files beginning with a dot in a folder). Just note that on my system my anaconda folder is ```anaconda3/``` (it may be ```anaconda/``` on yours):

```
# Some environmental variables for JuliaPro to fetch
export PYTHON=${HOME}/anaconda3/bin/python
export JUPYTER=${HOME}/anaconda3/bin/jupyter

# Deprecated PATH variable reset
#export PATH="/anaconda3/bin:${PATH}"

# Making conda command available
. /anaconda3/etc/profile.d/conda.sh

# Pretty colours for ls (yellow/brown for directory)
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Setting aliases
alias ..="cd .."
alias ll="ls -al@"
alias cloud="cd ${HOME}/Library/Mobile\ Documents/com\~apple\~CloudDocs"

# Settings for iTerm2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
```

In the pretty colours section, I make some colour rules for the display of files according to their type. Unfortunately I am not able to recall/attribute where I first learned this. This is helpful for making the output from ```ls``` more informative.

In the setting aliases section, I create some shortcuts to reduce typing. As you can see I am using this to access my elusive iCloud folder (MacOS only) as well as to shortcut some frequently used BASH commands.

Finally, you can see code added by iTerm2 for shell integration.
