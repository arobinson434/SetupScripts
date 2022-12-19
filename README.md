# SetupScripts
This repository houses scripts and configuration to setup a fresh Linux install
according to my own preferences. Feel free to fork this project to apply your
own preferences!

## Usage
To use this tool, simply run `./setup.sh` in the project root. Note: You must
have `sudo` privileges to run this script, though you should **NOT** run the
script as root or with `sudo` directly!

The script will detect the OS variant (currently only supporting redhat and
debian), and install the appopriate packages, scripts, and config.

## Project Layout
This utility is divided into two main parts, *common* configuration and *OS 
specific* configuration. The main `setup.sh` script in the project root will
always run the *common* config and then run the *OS specific* configuration
if the host OS can be determined.

### Common Config
The common configuration houses setup steps that should be applied to all Linux
hosts. Presently, it performs the following tasks:
* Copies over custom tools/scripts; Housed in `common/util_scripts/`
* Writes config files for various tools, e.g. vim, tmux, etc; Housed in `common/conf_writers/`
* Adds common packages to the list of packages to install
* Sets my `bash` preferences

### OS Specific Config
As of yet, I haven't setup much customization based on OS. Presently, the OS
specific config scripts do the following:
* Add OS specific packages to the list of packages to be installed
* Provide an `install_packages` function which makes use of the appropriate package manager

