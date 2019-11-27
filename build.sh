#!/usr/bin/env sh
#
# To generate a docker image of ACOrN on your local machine, run this script with present working directory ~/ampersand-models/ACOrN.
# It builds the different docker images.
# The first is MariaDB, on which all prototypes are built.
# The second is the PHP environment needed for every Ampersand prototype
# The third is the ACOrN system

set -e   ## stops the script upon the first error.

echo "Building ACOrN from ampersandtarski/acorn"
git clone https://github.com/AmpersandTarski/docker-ampersand/ /home/$(whoami)/docker-ampersand
cd /home/$(whoami)/docker-ampersand/
docker build --tag ampersandtarski/acorn:latest .
