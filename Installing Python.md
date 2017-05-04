# Installing Python
I'm going to give some advice here on how to install the python programming language. The focus is MacOS, but Anaconda is actually cross-platform. Regarding other languages, I cannot advise on Perl or Ruby installation (I have experimented with CPAN and RVM, but not satisfactorily).

## Basic Approach: Virtual Environments
I hugely prefer installing python via the [Anaconda distribution](https://www.continuum.io/downloads). Conda is a package manager which is very effective and the advantages of installing python this way is:

* tight control of virtual environments,
* isolation of these from the system python,
* complete cross-platform support,
* compatibility with and tracking of pip.

On the last point, you can still use ```pip freeze > requirements.txt``` and ```pip install -r requirements.txt``` to save and regenerate an environment between systems in addition to conda-specific commands (below).

Anaconda is a particular distribution of python with conda and a group of scientific packages in common use with python (e.g., ```numpy```, ```matplotlib``` and ```jupyter```: I have written a separate guide to jupyter installation). It is then easy to install additional packages you may need (such as ```biopython```). If you want a more minimal install try [Miniconda](https://conda.io/miniconda.html) which basically gives you the package management and python.

I recommend installing Anaconda python 3.6 first so that your root conda environment is python3. Then you can use:
```
conda create -n py27 python=2.7 anaconda biopython
```

to create an additional python2 environment (assuming you want biopython in it also, otherwise omit). I also create specialist environments for other projects (e.g., with ```django``` or ```tensorflow```).

## Running Python Scripts
I advise beginning your python scripts with a header line that points to the default python in the environent:
```
#!/usr/bin/env python3
```

If your script is executable (check with ```ls -l```) you can then invoke it with ```./scriptname.py <ARGS>```. If your script isn't executable, you can change permissions using the ```chmod``` command with the [appropriate octal code](http://permissions-calculator.org), e.g., ```chmod 755 myscript.py```. You only need to do this once.

## Useful *conda* Commands

* To update conda and then anaconda:
```
conda update conda
conda update anaconda
```

* Spring cleaning if you've been updating a lot:
```
conda clean --packages --tarballs
```

* To activate/inactivate a virtual environment (e.g., py27) you've already installed:
```
source activate py27
source deactivate
```
you will note from my terminal tips document that I add aliases for these commands.

* To get information on current environments:
```
conda info --envs
```

* To remove an environment (e.g., phipy) and all its packages:
```
conda remove --name phipy --all
```

* You can't change environment names (for good reasons), but you can clone them:
```
conda create --name ben --clone phipy
```
(then delete the old one).


## Bioconda Notes (early stage)
The value of conda package management goes beyond python. Check out [bioconda](https://bioconda.github.io), a project in which conda is used to distribute otherwise difficult-to-install bioinformatics packages (see below). Here are some typical commmands (and these are taken from [the bioconda website](https://bioconda.github.io)):

* adding channels (order matters for priority of access)
```
conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels r
conda config --add channels bioconda
```
* checking channels (and their priorities)
```
conda config --get channels
```
* removing channels (e.g., pandas)
```
conda config --remove channels pandas
```
* example: installing oauth2client from google
```
conda install -c bioconda oauth2client
```
