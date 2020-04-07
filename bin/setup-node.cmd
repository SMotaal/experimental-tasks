:; `dirname "$0"`/execute.cmd `basename -s .cmd "$0"` "$@"; exit $?;
@echo off
set thisdir=%~dp0
set arguments=%*
echo Not implemented for Windows yet.
