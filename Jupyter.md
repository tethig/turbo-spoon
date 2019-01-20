# Jupyter
Jupyter (formerly known as ipython notebook) is an [awesome project](http://jupyter.org) that can be used to share code in an executable format with rich annotation and support for graphical output. What follows is my notes on basic usage of Jupyter and installing kernels other than python. The prerequisite is to install python (and I would recommend doing this via [the anaconda website](https://www.continuum.io/downloads); see my guide to (Ana)conda in this repository).

## Installation
The notebook is installed as part of the Anaconda environment. At the time of writing, the current jupyter_core version is 4.4.0. To check type whether your virtual environment includes jupyter components type ```conda list``` in Terminal. If jupyter is missing (perhaps because you are using miniconda) type:
 ```
 conda install -c anaconda jupyter
 ```
The -c means to fetch the program from a specific channel, in this case the anaconda channel. Note you can also add ```—n env``` where env is name of environment you wish to install into. Thanks to [this repository](https://github.com/ageron/handson-ml) I can also recommend Jupyter extensions (optional):
```
conda install -c conda-forge jupyter_contrib_nbextensions
```

## Running Jupyter
* It’s as simple as typing ```jupyter notebook``` in Terminal. This serves a local host in your default browser.

* If you’re in the right folder you can open a particular notebook straightaway using ```jupyter notebook name_of_notebook.ipynb```.

* In your server get used to keyboard shortcuts by selecting “Keyboard Shortcuts” from the Help menu.

* When you’re done with a notebook remember to save it (File menu), then select “Close and halt” from the file menu to close it. To close the server return to the terminal window and type ```Ctrl-C``` to close the server down.

* FYI: kernels are stored here on a mac ```~/Library/Jupyter/kernels```. The next section shows you how to add some additional kernels.

*  to find out where jupyter keeps stuff: ```jupyter --paths```.

## Adding Kernels
Kernels are the engines that power an instance of a jupyter notebook. The iPython kernel is installed automatically with jupyter. Julia and R are optional - that's why it's called JuPyteR. For a full list of available kernels [check here](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels).

### Additional Python Versions
If you are managing python with (Ana)conda, it is simplest to have jupyter installed in each python environment.

### Julia Core Language
This is best installed as an app from the [disk images here](https://julialang.org/downloads/). I'm not too hot on Juno (which turns your Atom into an [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment)) because it's rather complex, but you may feel differently.

At the time of writing the current version of Julia is 0.5.1. I’ve prepended the location of the installed app (```/Applications/Julia-0.5.app/Contents/Resources/julia/bin```) to my PATH environmental variable in Terminal (see my Terminal Tips guidance also in this repository). After doing this you can simply invoke the Julia [REPL](https://en.wikipedia.org/wiki/Read–eval–print_loop) by typing ```julia``` in Terminal.

### iJulia Kernel
For the IJulia kernel follow [these instructions](https://github.com/JuliaLang/IJulia.jl) carefully. If you've done everything as above and your name (and home directory) is "ben" (!), the short version is to type these commands into the Julia REPL:
```
ENV["JUPYTER"]="/anaconda3/bin/jupyter"
using Pkg
Pkg.add(“IJulia”)
```
You should then be able to launch the notebook as above and create a new Julia notebook. Or within Julia:
```
using IJulia
notebook(dir=pwd())
```

### R Core Application
Install R via the Comprehensive R Archive Network (CRAN; [choose a local mirror](https://cran.r-project.org/mirrors.html)). Mac users can, if they feel like it, find nightly builds on [this bleeding edge repository](http://r.research.att.com/). I use the R app only (and Atom for script editing), but new R users benefit from additionally installing and using [RStudio Open Source Edition](https://www.rstudio.com/products/RStudio/).

### iRkernel for Jupyter
For the R kernel based on instructions [here on the kernel GitHub page](https://irkernel.github.io/installation/):

* open R by typing ```R``` in terminal (don't use the GUI).

* then install the kernel (I pointed this to a UK mirror for installation):
```
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'), repos='https://mirrors.ebi.ac.uk/CRAN')
devtools::install_github('IRkernel/IRkernel')
```

* must then make available for jupyter to all users:
```
IRkernel::installspec(user = FALSE)
```

## Public Jupyter Notebooks
Jupyter notebooks are supported natively by GitHub ([this is one of my biological examples](https://github.com/tethig/simulations/blob/master/DFEM_py_nb.ipynb)). There are also some other servers with example notebooks. The Jupyter project themselves have some samples [at this site](https://nbviewer.jupyter.org) and [at this site](https://try.jupyter.org).
