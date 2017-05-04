# Jupyter Tips
Jupyter (aka ipython notebook) is an awesome project. I will be providing more detail on this later. For now here is a dump of my notes on installing kernels other than python. The prerequisite is to install python (2.7 will do) via [the anaconda website](https://www.continuum.io/downloads).

The notebook is installed as part of the anaconda environment. The current notebook version is 4.1.0. To check type ```conda list```. If it’s missing (perhaps because you are using miniconda) type ```conda install -c anaconda jupyter``` (-c means go get from anaconda environment, you could add “—-name env” where env is name of environment, but easier just to work in active environment: default location for install).

## Adding Kernels
Kernels are the engines that run inside the notebook. The IPython kernel is installed automatically with jupyter. Julia and R are optional - but that why its called jupyter!

### Julia
This is best installed as an app from the [disk images here](http://julialang.org/downloads/) (I'm not too keen on Juno - too complex).

I’ve prepended the location to the PATH env variable in .bash_profile:
``/Applications/Julia-0.4.6.app/Contents/Resources/julia/bin
```
So to invoke julia you can just type:
julia

For the IJulia kernel [based on instructions here](https://github.com/JuliaLang/IJulia.jl):

* Inside Julia just type:
```Pkg.add(“Julia”)
```

###R
Obviously this is optional because you can use R or RStudio and have plenty of power - but it is cool to run R in the browser! Install R the usual way via the CRAN.

For the R kernel [based on instructions here](https://irkernel.github.io/installation/#binary-panel):

* open R by typing ```R``` in terminal (don't use the GUI).

* then install the kernel:
```install.packages(c('repr', 'IRdisplay', 'crayon', 'pbdZMQ', 'devtools'), repos='https://mirrors.ebi.ac.uk/CRAN')
devtools::install_github('IRkernel/IRkernel')
```

* must then make available for jupyter and generalise to all users
```IRkernel::installspec()
IRkernel::installspec(user = FALSE)
```

## Running Jupyter
* It’s as simple as typing ```jupyter notebook``` in terminal. This serves a local host in your default browser.

* In your server get used to keyboard shortcuts by selecting “Keyboard Shortcuts” from the Help menu.

* If you know you’re in the right folder you can open a particular notebook straight from the terminal using:
```jupyter notebook name_of_notebook.ipynb
```

* When you’re done with a notebook remember to save it (File menu), then select “Close and halt” from the file menu to close it. To close the server return to the terminal window and type ```Ctrl-C``` to close the server down.

* FYI: kernels are stored here on a mac ```~/Library/Jupyter/kernels```.

*  to find out where jupyter keeps stuff: ```jupyter --paths```.

## Some Resources
* The project is still working on their documentation so check back here:
http://jupyter.org

* They have an example notebook here which explains what some of the buttons do:
https://try.jupyter.org
