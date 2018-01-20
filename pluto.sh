#!/bin/bash
# pluto.sh
#
# ♥ CHAVE PLUTO Encryptor/Decryptor ♥
# 
# Encrypts and decrypts messages and text
# files following the "CHAVE PLUTO" method.
#
# License: CC0 1.0 Universal (Public Domain)
#
#    ***     ***
#  **   ** **   **
# *       *       *
# *     CHAVE     *
#  *    ↓↓↓↓↓    *
#   **  PLUTO  **
#     **     **
#       ** **
#         *
#
# Version 1.0: Initial release.
#
# (ɔ)Copyleft 2014 - Igor Isaias Banlian
#

HELP_MESSAGE="
Usage: $(basename "$0") [TEXT] [TEXT FILE]

OPTIONS:
  -h, --help     Show this help screen and exit
  -V, --version  Show the program version and exit
"

if test -n "$1"
then
    case "$1" in

        -h | --help)
            echo "$HELP_MESSAGE"
            exit 0
        ;;

        -V | --version)
            echo -n $(basename "$0")
            grep '^# Version ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
            exit 0
        ;;

        *)
            if test -f "$1"
            then
                TEXT=$(cat "$1")
            else
                TEXT="$1"
            fi
            echo "$TEXT" | sed '
                                y/CHAVEPLUTO/PLUTOCHAVE/
                                y/chavepluto/plutochave/
                                y/ÀÁÂÃÄÈÉÊẼËÒÓÔÕÖÙÚÛŨÜ/ÙÚÛŨÜÒÓÔÕÖÈÉÊẼËÀÁÂÃÄ/
                                y/àáâãäèéêẽëòóôõöùúûũü/ùúûũüòóôõöèéêẽëàáâãä/'
        ;;

    esac
else
    echo "$HELP_MESSAGE"
    exit 0
fi
