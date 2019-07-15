#!/bin/bash

# sudo apt install curl
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.bashrc
version="nvm --version"
exec "$version"
