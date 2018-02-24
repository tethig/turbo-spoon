# Installing python via conda
Conda is a package manager that can be used to install the python programming language and many other programs. As a package manager it makes light work of installing dependencies. Anaconda is a scientific python distribution (python + numerical/scientific libraries such as numpy, scipy, matplotlib, jupyter and scikit-learn) distributed via conda. For bioinformatics bioconda has become very prominent.

This repo is a guide to installing and working with conda. The focus is MacOS, but (Ana)conda is cross-platform. I cannot advise on Perl or Ruby installation (I have experimented with CPAN and RVM, but not satisfactorily). I have written a separate guide to jupyter in this repo.

## Basic Approach: Virtual Environments
I have long preferred installing python via the Anaconda distribution. The advantages of installing python this way is:
* co-installation of a range of numerical/scientific libraries,
* tight control of virtual environments,
* isolation of these from the system python (improved since 4.4),
* cross-platform support,
* compatibility with and tracking of pip (a python package installer).

You can easily install additional packages you may need (e.g., biopython). If you want a more minimal install with the same flexibility try [Miniconda](https://conda.io/miniconda.html) which gives you the package manager and python.

## Installation
To install Anaconda visit [this website](https://www.continuum.io/downloads) and follow the instructions for your OS. I recommend installing Anaconda python 3.6 first so that your root conda environment is python3. Then you can use:
```
conda create -n py27 python=2.7 anaconda biopython
```
to create an additional python2 environment (assuming you want biopython in it also, otherwise omit). You can create specialist environments for other projects - some examples include django (for web development) or tensorflow (for deep learning).

## Running Python Scripts
I advise beginning your python scripts with a header line that points to the default python in the environent:
```
#!/usr/bin/env python3
```
If your script is executable (check with ```ls -l```) you can then invoke it with ```./scriptname.py <ARGS>```. If your script isn't executable, you can change permissions using the ```chmod``` command with the [appropriate octal code](http://permissions-calculator.org), e.g., ```chmod 755 myscript.py```. You only need to do this once.

## Useful *conda* Commands

### Basic environment management
* From version 4.4 onwards the default conda environment has become inactive by default in bash. To invoke it:
```
conda activate
```
* To return to bash without conda:
```
conda deactivate
```
* You may be advised during the above that conda is not active in the current environment. To make conda commands accessible you may be advised to add the following line to .bash_profile (depending on conda's exact install location):
```
. /anaconda3/etc/profile.d/conda.sh
```
_If you have or have previously had an older version of conda the conda location is prepended to the PATH variable in this file (see my terminal tips document in this repo). If you've now updated to conda 4.4 you will be advised to remove this from .bash_profile - this is important and prevents cross-talk between homebrew and conda._

* To activate/inactivate a virtual environment (e.g., py27) you've already installed:
```
conda activate py27
conda deactivate
```

### More environment management
* To get information on current environments:
```
conda info --envs
```

* To update conda itself (be aware of channel priority - see below):
```
conda update conda
```

* To update installed packages in an anaconda environment this is recommended:
```
conda update anaconda
```

* To update all installed packages in a non-anaconda environment:
```
conda update --all
```

* To install a new package (you can use conda (preferred) or pip if needed), e.g.:
```
conda install tensorflow
pip install git+https://github.com/tflearn/tflearn.git
```

* Conda tracks changes made my pip so you can see all packages installed by conda and pip using:
```
conda list
```

* You can store an environment on one machine and regenerate on another:
```
source_env $ conda env export -n <env-name> > environment.yml
sink_env   $ conda env create -f environment.yml
```

* Or you can do this with pip too:
```
source_env $ pip freeze > requirements.txt
sink_env   $ pip install -r requirements.txt
```

* You can do some spring cleaning if you've been updating a lot:
```
conda clean --packages --tarballs
```

* To remove an environment and all its packages:
```
conda remove --name <env-name> --all
```

* You can't change environment names (for good reasons), but you can clone them:
```
conda create --name <env-name-1> --clone <env-name-2>
```
(then delete the old one).


## Bioconda and Channels
The value of conda package management goes beyond python. Check out [bioconda](https://bioconda.github.io), a project in which conda is used to distribute otherwise difficult-to-install bioinformatics packages (see below). The [bioconda paper](https://doi.org/10.1101/207092) is worth a look. Here are some typical commmands (and these are taken from [the bioconda website](https://bioconda.github.io)):

* adding channels (order matters for priority of access)
```
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
```
_Note that after this packages will be installed from bioconda, then from conda-forge, then from defaults. At the time of writing conda-forge was installing conda < 4.4 - so be mindful of priority order for channels._

* checking channels (and their priorities)
```
conda config --get channels
```
* removing channels (e.g., pandas)
```
conda config --remove channels pandas
```
_Note if you installed bioconda a long time back you may have added an R channel, I recommend removing if you don't need it._

* Install a particular package from a named channel (regardless of channel priority, e.g., oauth2client):
```
conda install -c bioconda oauth2client
```
