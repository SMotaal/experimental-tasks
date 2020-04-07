#!/usr/bin/env sh

# SEE: https://stackoverflow.com/a/27776822/12127490
case "$(uname -s)" in

Darwin)

  [ -z "${1:-}" ] && {
    echo "[$(basename "$0")]: path(s) not specified"
    exit 0
  }

  sudo chgrp -R admin $@ && sudo chmod -R g+w $@ # && sudo chown -R $(whoami) $@

  ;;

*) # Linux|CYGWIN*|MINGW32*|MSYS*|*

  echo "[$(basename "$0")]: Platform $(uname -s) is not supported — skipping."

  ;;

esac
