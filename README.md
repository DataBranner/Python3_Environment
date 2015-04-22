## Vagrant environment for Python 3 development

This README is dated 20150421.

This repository contains a Vagrantfile and other content sufficient to set up Ubuntu "Trusty" (64bit, v. 13.4.0) and a `pyvenv` virtual environment for Python v. 3.4.

Below I will talk about "host" and "guest" operating systems. The "guest" is the Ubuntu system that you install and then access using Vagrant. The "host" is the operating system on your computer where Vagrant is being run.

The working Vagrantfile (the configuration file for a Vagrant environment) is in the top-level directory of the repository. To use:

 1. Clone this entire repository into the directory where you want it to live. I suggest making a special directory `develop` or `vagrant_environments` or something explicit of that sort. The simplest way to do it will look like this:

        cd ~/develop
        git clone https://github.com/dpbmm/Python3_Environment.git
        cd Python3_Environment

    Notice that by default the name of the subdirectory (within `develop`) into which the repo is cloned will be the same as the name of the project — `Python3_Environment`.

 1. Install Vagrant on your host operating system, following instructions beginning [here](http://docs.vagrantup.com/v2/installation/). What follows assumes your host operating system is Mac OS 10.9.5; your guest operating system is the one being provisioned by Vagrant. I am using VirtualBox as my virtual machine, but other choices are possible.
 1. Initialize, run, and log in to the Vagrant environment as described in the sections below. Note:

    > If you run vagrant by itself, help will be displayed showing all available subcommands. In addition to this, you can run any Vagrant command with the -h flag to output help about that specific command.
      
    Further instructions will be found at the Vagrant site.

### Launching

After cloning, enter the top-level directory, and do set-up with this single step:

    vagrant up

The first time you do this, a virtual machine will be provisioned and launched; later, unless you destroy the environment, the existing virtual machine will simply be launched without re-provisioning. On a recent MacBook Pro running OS 10.9.5, provisioning takes about two or three minutes; launching without re-provisioning takes about twenty seconds.

### Logging in to a running virtual machine

    vagrant ssh

You will be logged in as the user `vagrant` with administrative privileges and the password `vagrant`. The prompt should look like this:

    (v_env34) vagrant@vagrant-ubuntu-trusty-64:/vagrant$

Each piece of this prompt has a meaning.

The element `vagrant@vagrant-ubuntu-trusty-64` means that you are logged in as user `vagrant`, and that your hostname is `vagrant-ubuntu-trusty-64`.

The element `(v_env34)` at left indicates that you are using the `pyvenv` virtual environment "v_env34". You can always leave the environment by typing

    deactivate

After deactivating, you can reactivate it with:

    cd /vagrant
    source v_env34/bin/activate

The element `/vagrant` (note the backslash) is the name of your present working directory in the guest OS. It corresponds to the top-level directory on your host operating system. From within the guest you will not be able to access anything on your host system outside of that top-level directory unless you make changes to the Vagrantfile. 

I suggest that you edit files using an editor on your host operating system, and use the virtual machine only to run code in the guest operating system. If you want to create your own repository, I suggest copying only the files

 * `Vagrantfile`
 * `requirements_py34.txt`
 * directory `scripts`
 
to a new directory and then using `vagrant up` to provision a new environment and `git init` and other git commands to populate the repository. Do this in the host operating system, not the guest system.

### Logging out and shutting down

To log out, use

    exit

at the command line. Note that this will leave the virtual machine running. To fully shut down the virtual machine, use

    sudo shutdown -h 0

### Installing more software

In order to use `pip` to install Python packages you will need to be working within an activated virtual environment. `pip -h` will give you basic commands — `pip install`, `pip uninstall`, and `pip search` cover about 99% of my usage. The "update" option (`-U`) is useful with `pip install`, but remember that there are times when one _doesn't_ want to update to a newer version of a package. To ensure that new installations are recorded in your `requirements_py34.txt` file, use

    pip freeze > requirements_py34.txt

In order to install Ubuntu packages, we normally use

    sudo apt-get update
    sudo apt-get install <names>

But `apt-get` doesn't have a `search` command; instead, we use

    sudo apt-cache search <names>

Do remember that packages installed on your guest OS will not be available to you on the host OS, and vice versa.

[end]
