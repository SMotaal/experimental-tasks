#!/usr/bin/env sh

NPM_PREFIX="${NPM_PREFIX:-"${HOME}/.npm/node_modules"}";

NODE_VERSION="${NODE_VERSION:-$(curl -s https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}";

# SEE: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
mkdir -p "${NPM_PREFIX}";


# SEE: https://stackoverflow.com/a/27776822/12127490
case "$(uname -s)" in

  Darwin)

    # SEE: https://nodejs.org/en/download/package-manager/#macos
    echo "Installing Node.js ${NODE_VERSION}"
    curl "https://nodejs.org/dist/latest/node-${NODE_VERSION}.pkg" > "$HOME/Downloads/node-${NODE_VERSION}.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-${NODE_VERSION}.pkg" -target "/"

    npm config set prefix "${NPM_PREFIX}";
    ;;

  *) # Linux|CYGWIN*|MINGW32*|MSYS*|*
    echo "Please install n manually!"
    ;;

esac
