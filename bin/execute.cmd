:; cd `dirname "$0"` || exit $?
:; [ -z "${1:-}" ] && { echo "[$(basename "$0")]: command not specified"; exit 1; };
:; [ ! -f ./"$1".sh ] && { echo "[$(basename "$0")]: $1 is not a valid command"; exit 1; };
:; $(echo ./"$1".sh "${@:2}")
:; exit $?
@echo off
set thisdir=%~dp0
set arguments=%*
echo Not implemented for Windows yet.
