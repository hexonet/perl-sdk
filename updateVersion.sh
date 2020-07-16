#!/bin/bash

# THIS SCRIPT UPDATES THE HARDCODED VERSION
# IT WILL BE EXECUTED IN STEP "prepare" OF
# semantic-release. SEE package.json

# version format: X.Y.Z
newversion="$1";

printf -v sed_script "s/declare('v[0-9]\+\.[0-9]\+\.[0-9]\+')/declare('v%s')/g" "${newversion}"
sed -i -e "${sed_script}" Makefile.PL t/Hexonet-connector.t lib/WebService/Hexonet.pm lib/WebService/Hexonet/Connector.pm lib/WebService/Hexonet/*.pm
