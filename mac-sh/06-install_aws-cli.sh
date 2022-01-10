#!/bin/sh

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/Users/imykhaylyuk/AWSCLIV2.pkg"

installer -pkg /Users/imykhaylyuk/AWSCLIV2.pkg \
            -target CurrentUserHomeDirectory \
            -applyChoiceChangesXML ./install-aws-cli.yml

sudo ln -s /Users/imykhaylyuk/aws-cli/aws /usr/local/bin/aws
sudo ln -s /Users/imykhaylyuk/aws-cli/aws_completer /usr/local/bin/aws_completer

which aws
aws --version
