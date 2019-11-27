# This script is meant to build from the root directory of your ACOrN-repo.
FROM ampersandtarski/ampersand-prototype:texlive AS build

ENV AMPERSAND_DB_HOST=db

# link to the current directory to get application sources
RUN mkdir /src
ADD . /src
RUN mkdir /SIAM
ADD ./SIAM /SIAM
RUN mkdir /Sequences
ADD ./Sequences /Sequences

# stuff needed for gulp
RUN apt update \
 && apt install -y gnupg \
 && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && npm i -g gulp-cli

# USER ampersand

# build ACOrN application from folder
RUN ampersand /src/ACOrN/ACOrNdev.adl --config=/src/ACOrN/ACOrNdev.yaml -p/var/www/html/ACOrN \
 && mkdir -p /var/www/html/ACOrN/log \
 && chown -R www-data:www-data /var/www/html/ACOrN \
 && cd /var/www/html/ACOrN \
# && npm i gulp \
 && npm install \
 && gulp build-ampersand \
 && gulp build-project

VOLUME /var/www/html/ACOrN
FROM alpine:latest
COPY --from=build /var/www/html/ACOrN /var/www/html/ACOrN

# build Enrollment demo, which is being used in the Ampersand-tutorial
RUN ampersand -p/var/www/html/Enroll /src/Demos/Enroll/Enrollment.adl --verbose --sqlHost=db --sqlLogin=ampersand --sqlPwd=ampersand \
 && mkdir -p /var/www/html/Enroll/log \
 && chown -R www-data:www-data /var/www/html/Enroll
