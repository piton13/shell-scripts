#!/bin/bash

# will be better to install previous version to prevent Java errors
# PREFIX=~/.okta bash <(curl -fsSL https://raw.githubusercontent.com/oktadeveloper/okta-aws-cli-assume-role/master/bin/install.sh) -i

echo "OKTA_ORG=dat.okta.com
OKTA_AWS_APP_URL=https://dat.okta.com/home/amazon_aws/0oacouholtTafzANO0x7/272
OKTA_AWS_ROLE_TO_ASSUME=arn:aws:iam::265010015359:role/DATDeveloper
OKTA_AWS_REGION=us-west-2
OKTA_USERNAME=igorm@tcore.com
OKTA_BROWSER_AUTH=false" > ~/.okta/config.properties

# echo "
# if [ -f "$HOME/.okta/bash_functions" ]; then
    # . "$HOME/.okta/bash_functions"
# fi
 
# if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
         # PATH="$HOME/.okta/bin:$PATH"
# fi " >> ~/.profile
