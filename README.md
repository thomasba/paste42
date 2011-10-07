# Description

A small bash scipt pasting files to paste42.de

# Features

* Create private pastes
* Syntax highlighting
* Set an expiration for the paste
* Set an passwort to delete the paste

# Installation

* Arch Linux
    * get the `PKGBUILD`
    * run `makepkg`
* Other Linux Systems
    * `install -D -m755 paste42.sh /usr/bin/paste42`

# Usage

    /usr/bin/paste42 [-s] [-t "type"] [-l] [-e 10m|1h|1d|1w|4w|1y|date] file
    -s           not "public"
    -t <type>    file type
    -l           filetypes
    -h           this help
    -u           check for update
    -e <time>    expiration:
                   10m = 10 minutes ; 1h = 1 hour ; 1d = 1day ;
                   1w = 1 week ; 4w = 4weeks ; 1y = 1 year ;
                   or date: YYYY-MM-DD HH:II:SS
    -p           set a password to delete the paste
