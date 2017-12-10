# Improving Terminal
Terminal on MacOS is the interface for the [Bourne-Again SHell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)). Here are a few optimisations I recommend:

## Adjustments to Window Display
If you want the same Terminal you've seen on my system, here is what I've done:

* Select Preferences from the Terminal Menu.
* In the General tab at the top, choose "Ocean" as the profile for a new window (first menu).
* In the Profiles tab at the top, select "Ocean" as the default profile.
* Also in Profiles, and with Ocean selected on the left, select "Color & Effects" (in the Text tab) and adjust the Opacity to 75%.
* Choosing the Window tab (still in Profiles/Ocean) adjust the dimension of the window. My mac has an ultra-high resolution so I have 120 columns by 72 rows.

Now you have a floating, semi-transparent, large space to work in. Take it or leave it...

## iTerm2
You may prefer a complete replacement for Terminal. One such option is [iTerm2](https://iterm2.com). In this I use a profile (in Preferences) based on a colour scheme called "OceanicMaterial". To browser other themes see [this site](http://iterm2colorschemes.com). I have also selected "Install Shell Integration" from the iTerm2 menu (for effects of this see below). iTerm can also integrate with tmux, the next program.

## tmux
I used to use the terminal multiplexer called "screen" (shortcut: Ctrl-a). I am now enthusiastic about "tmux" (shortcut Ctrl-b). Here is [excellent run through](http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)) of tmux. For installation simply type:
```
brew install tmux
```
or for Ubuntu systems:
```
sudo apt install tmux
```
The example above also shows a nice alternative to the "top" monitoring app called "htop" which can be installed in the same way (just sub htop for tmux in the code above).

## Adjustments to BASH Profile
So using BASH entails a lot of typing and therefore it is useful to adjust settings to reduce typing. For this is common to adjust a file called ```.bash_profile```. This file can set environmental variables in BASH (to see these type ```env```) and a particularly common instance is the PATH variable (to see this: ```echo $PATH```) which instructs BASH where to look for the meaning of what you just typed in. If you have programs stored in unique folders these need to be added to the PATH variable and you will see some of this below. However, there is a neater way to postpend folder paths to the PATH variable and this is [described here](http://postgresapp.com/documentation/cli-tools.html) for PostgresSQL (invoke as ```psql```). I've done similarly - adding a single file containing the PATH to my ```/etc/paths.d``` directory for my JuliaPro application:
```
echo /Applications/JuliaPro-0.6.1.1.app/Contents/Resources/julia/Contents/Resources/julia/bin | sudo tee /etc/paths.d/julia
```
Another method is to place softlinks (using ```ln -s```) into ```/usr/local/bin```.

However for (ana|mini)conda the installers tend to prepend the (e.g.) anaconda folder to the PATH variable. This is because you wish to invoke the conda version of (e.g.) python before the system version. This is usually fine, but it is a problem for homebrew. An elegant solution for this problem is [described here](https://hashrocket.com/blog/posts/keep-anaconda-from-constricting-your-homebrew-installs) (complete with mythological references). I have simply adopted this solution wholesale to reduce conflict between homebrew and conda.

So here, acknowledging the above sources, is the contents of my ```.bash_profile``` in my home directory (recall that ```ls -a``` is required to detect secret files, beginning with a dot, in a folder):

```
# Setting PATH proto-variable (with no snakes)
NOCONDA="${PATH}"
export NOCONDA

# Setting default PATH variable (with snakes)
export PATH="${HOME}/anaconda/bin:${NOCONDA}"

# Some environmental variables for JuliaPro to fetch
export PYTHON=${HOME}/anaconda/bin/python
export JUPYTER=${HOME}/anaconda/bin/jupyter

# Pretty colours for ls (yellow/brown for directory)
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Setting aliases
alias ..="cd .."
alias ll="ls -al@"
alias cloud="cd ${HOME}/Library/Mobile\ Documents/com\~apple\~CloudDocs"

alias perseus="export PATH="\$NOCONDA" && echo Medusa decapitated."
alias medusa="export PATH="\${HOME}/anaconda/bin:\$NOCONDA" && echo Perseus defeated."

# Clear the snakes for homebrew
brew () {
  perseus
  command brew "$@"
  medusa
}

# Settings for iTerm2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
```

In the pretty colours section I make some colour rules for the display of files according to their type. Unfortunately I am not able to recall/attribute where I first learned this. This is helpful for making ```ls``` more informative.

In the setting aliases section I create some shortcuts to reduce typing. As you can see I am using this to access my elusive iCloud folder (MacOS only) as well as to shortcut some frequently used BASH commands. (I used to shortcut ```source activate env_name``` conda commands but I've decided that's too lazy now).

You can also see how the method describes above modifies the ```brew``` commands bookending it with commands to remove/return the prepended anaconda path from PATH. And you can see code added by iTerm2 for shell integration.
