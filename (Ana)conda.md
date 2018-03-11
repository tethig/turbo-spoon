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
I advise beginning your python scripts with a header line that points to the default python in the environment:
```
#!/usr/bin/env python3
```
If your script is executable (check with ```ls -l```) you can then invoke it with ```./scriptname.py <ARGS>```. If your script isn't executable, you can change permissions using the ```chmod``` command with the [appropriate octal code](http://permissions-calculator.org), e.g., ```chmod 755 myscript.py```. You only need to do this once.

## Useful *conda* Commands

### Installing packages and moving between environments
* From version 4.4 onwards the default conda environment has become inactive by default. To invoke it:
```
conda activate
```
* To return to bash/zsh without conda:
```
conda deactivate
```

* To activate/deactivate a virtual environment (e.g., py27) you've already installed:
```
conda activate py27
conda deactivate
```

* To install a new package in the current environment (you can use conda (preferred) or pip if needed), e.g.:
```
conda install tensorflow
pip install git+https://github.com/tflearn/tflearn.git
```

* Conda tracks changes made by pip so you can see all packages installed by conda and pip using:
```
conda list
```

### Environment management
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

* To get a list of current environments:
```
conda info --envs
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

* You may be advised at some point using conda that conda is not active/accessible to your shell. To make conda commands accessible you may be advised to add the following line to .bash_profile, .bashrc or .zshrc (depending on your shell and assuming conda's install location is /anaconda3/):
```
. /anaconda3/etc/profile.d/conda.sh
```
If you have or have previously had an older version of conda the conda location is prepended to the PATH variable in this file (see my terminal tips document in this repo). If you've now updated to conda 4.4 you will be advised to remove this from .bash_profile - this is important and prevents cross-talk between homebrew and conda.

### Updates, channels and pinning

* Conda installs and updates from channels. To see a list of channels and their priorities:
```
conda config --get channels
```
Adding channels is covered in the next section.

* Unless you've added more (next section) you will only have the defaults channel which references several Continuum sources. To see the URLs for these:
```
conda config --env --show default_channels
```

* To update conda itself:
```
conda update conda
```

* But other channels you use (and give priority to) may cause a rollback of some packages. At the time of writing I have pinned the conda package itself to the defaults channel to prevent its being downgraded by other channels:
```
conda config --system --add pinned_packages defaults::conda
```

* To reveal or undo pinned packages:
```
conda config --system --show pinned_packages
conda config --system --remove pinned_packages defaults::conda
```
Nearly this exact change was [recommended here](https://www.anaconda.com/blog/developer-blog/how-to-get-ready-for-the-release-of-conda-4-4/) to prevent version "flipping" for conda-forge users.

* To update installed packages in my base anaconda environment I currently use:
```
conda update -c defaults --all
```

* If you are using anaconda channels (check "Channel" column in output of ```conda list```) this is recommended:
```
conda update anaconda
```

* Install a particular package from a named channel (regardless of channel priority, e.g., oauth2client):
```
conda install -c bioconda oauth2client
```
You can also use ```-n``` as an option to push to an environment regardless of whether it is the current/active environment.

* You can do some spring cleaning if you've been updating a lot:
```
conda clean --packages --tarballs
```

### Bioconda and Community Channels
Check out [bioconda](https://bioconda.github.io), a project in which conda is used to distribute otherwise difficult-to-install bioinformatics packages. The [bioconda paper](https://doi.org/10.1101/207092) is worth a look. Here are some typical commmands (taken from [the bioconda website](https://bioconda.github.io)):

* Adding community channels required for bioconda (order matters for priority of access):
```
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
```
Note that after this packages will be installed from bioconda, then from conda-forge, then from defaults. At the time of writing conda-forge was installing conda < 4.4 so consider pinning conda as noted above.

* Remember you can check channels and their priorities:
```
conda config --get channels
```
* To see available package in conda-forge [visit this URL](https://conda-forge.org/feedstocks/).

* To see available packages in bioconda [visit this URL](https://bioconda.github.io/recipes.html).

* You can also remove channels (e.g., pandas):
```
conda config --remove channels pandas
```
Note if you installed bioconda a long time back you may have added an R channel, I recommend removing if you don't need it.
