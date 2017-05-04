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

## Adjustments to BASH Profile
Many times you need to do the same thing and typing a lot of things is tedious. If you don't have it already (check with ```ls -a```) make a file in you home directory called ```.bash_profile```. Here is the contents of mine:

```
# Setting PATH variable
PATH="/Applications/Julia-0.5.app/Contents/Resources/julia/bin:$PATH"
PATH="${HOME}/anaconda/bin:$PATH"
export PATH

# Pretty colours for ls (yellow/brown for directory)
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Pointers to CUDA installation
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:${CUDA_HOME}/lib"
export PATH="${CUDA_HOME}/bin:${PATH}"

# Setting aliases (py36 is default conda env)
alias ..="cd .."
alias cloud="cd ${HOME}/Library/Mobile\ Documents/com\~apple\~CloudDocs"
alias ll="ls -al"
alias py27="source activate py27"
alias py36="source deactivate"
```

You can see in the first section I prepend (and then postpend) some directories to my PATH, before exporting. Anaconda directories must be prepended else python calls will reference the system python when in the default environment. You can interrogate the PATH variable using ```echo $PATH``` or all environmental variables using ```env```.

In the second section I make some colour rules for the display of files according to their type (not able to recall/attribute where I first learned this). This is helpful for making the display more informative.

In the third section I set some environmental variables specific to my system.

In the last section I create some aliases. These save me typing. As you can see I am using this to access my elusive iCloud folder as well as to shortcut some frequently used terminal commands (including (de-)activation of conda virtual environments).
