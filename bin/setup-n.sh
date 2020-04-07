#!/usr/bin/env sh

# SEE: https://stackoverflow.com/a/27776822/12127490
case "$(uname -s)" in

Darwin)

  [ -x /usr/local/bin/node ] || ./setup-node.sh

  function fix_permissions() {
    sudo chgrp -R admin $@ && sudo chmod -R g+w $@
  }

  # NOTE: The following is used when absolutely necessary
  # fix_permissions /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

  # SEE: https://apple.stackexchange.com/posts/189404/revisions
  fix_permissions /usr/local/bin/node
  [ -d /usr/local/lib/node_modules/ ] && fix_permissions /usr/local/lib/node_modules/
  [ -x /usr/local/bin/npm ] && fix_permissions /usr/local/bin/npm
  [ -x /usr/local/bin/npx ] && fix_permissions /usr/local/bin/npx

  [ ! -d /usr/local/n ] && mkdir /usr/local/n
  fix_permissions /usr/local/n

  npm i -g n

  ;;

*) # Linux|CYGWIN*|MINGW32*|MSYS*|*

  echo "Please install n manually!"
  ;;

esac
