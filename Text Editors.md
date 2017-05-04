# Text Editors
## Basic Options
Many excellent text editors exist and good basic starting places are:

Operating System | Text Editor
---------------- | -----------
MacOS | [TextWranger](http://www.barebones.com/products/textwrangler/)
Ubuntu/Linux | gedit [built-in]
Windows |[Notepad++](https://notepad-plus-plus.org)

But I am a fan of Atom (see the [Atom website](https://atom.io)) made by the GitHub folks (if you're reading this you probably know a little about GitHub already). This is cross-platform, very easy to adjust to your preferences and a pleasure to use. There is a little bit of a learning curve to start with, but if you remember the main shortcut (Cmd-, on a mac) then you can always access the setting pane. Below is how I "pimp my Atom" (not formal advice).

## Atom Settings
### Settings
The principle setting I change is to ensure that "Show Invisibles" is selected in the "Editor" section of Settings. This helps a lot with tracking indents, etc.

### Multitasking trick I had figured out earlier
Files open tentatively by default. You can double-tap them (in the pane or on their tabs) so that they open permanently (and are not replaced by other files you open).

### Packages I have installed
You can install packages via the "Install" link in Settings. These are ones I have installed:

Package | Purpose
------- | -------
ask-stack | find answers in Stack Overflow
atom-beautify | will sort out indenting for you with a single click
color-picker | choose colours from a pallet
data-atom | run \*SQL commands
emmet | lots of code completion (incl. bracket closing)
expose | Cmd-Shift-E to get an exposé style window picker
highlight-selected | as it says on the tin
language-r | language support for R
minimap | miniature version of script on right (helps you navigate)
minimap-cursorline | indicator of location in minimap
minimap-highlight-selected | extends function to minimap
minimap-pigments | extends function to minimap
open-recent | gives "Open Recent" option in File menu
pigments | loads of colour tools, incl. highlighting and tracking of colours in project
tablr | really cool way to display CSVs - still gives toggle to raw display

### Somewhat less used packages
These packages are good, but not always in use on my system:
* file-icons - gives file icons, but I inactivate this when using seti-ui (which comes with decent set; see below)
* language-arduino - you need an Arduino and a project!
* language-julia - Julia is cool, but you may not have it!
* git-time-machine - I haven't tried this yet.

### Themes
Appearance is everything. Atom allows control of UI (user interface) and syntax display. My currently installed **and activated** (see Themes section in Settings) UI theme is:
* seti-ui (brings icons with it as noted above)

And for my syntax theme:
* monokai-seti

A nice alternative set outside the defaults is:
* nord-atom-ui
* nord-atom-syntax
* *and activate "file-icons" from packages...*

### Protecting your sleep
Choosing themes is obviously an aesthetic matter, but when working late a dark screen is restful and healthful. On the latter, and if you wish to generally reduce your melantopic lux check out [f.lux software](https://justgetflux.com). The latest MacOS update gives yellow screen options (in SysPref, but default off), but f.lux seems more carefully designed to address the specific wavelengths of concern.

If you've no idea about the effects of light on health [read about some of them](http://dx.doi.org/10.1530/EC-16-0097).
