#
#   _  _____ ____ ____                        _   _      ____  _  ______
#  | |/ /_ _/ ___/ ___| _ __ ___   __ _ _   _| |_(_) ___|  _ \| |/ /  _ \
#  | ' / | |\___ \___ \| '_ ` _ \ / _` | | | | __| |/ __| | | | ' /| |_) |
#  | . \ | | ___) |__) | | | | | | (_| | |_| | |_| | (__| |_| | . \|  _ <
#  |_|\_\___|____/____/|_| |_| |_|\__,_|\__,_|\__|_|\___|____/|_|\_\_| \_\
#
#
#      Pull & Play, extremely verbose, KISS Dockerfile for Mautic 5.2.2
#
# This Dockerfile concentrates on simplicity and convenience for the person deploying the image,
# as well as clarity and verboseness for those wanting to understand what is going in the container.
#
# This adds a bit of complexity on the dockerfile itself, and breaks the one service per
# container rule, by design. It installs all the components required to run Mautic in one single
# Docker container. It deploys Apache2, PHP-FPM, MariaDB and Mautic, as well as many required packages
# and some configuration files for those services.
#
# The database is prepopulated with a user and a Mautic database as well as the Mautic DB schema, so
# you don't have to go through Mautic's installation process.
#
# Intended uses:
# - A simple way to test Mautic, pull & play.
# - A live overview of Mautic requirements.
# - A starting point for Mautic code exploration and tinkering.
# - A way to learn about Dockerization, Dockerfiles and Docker image creation.
#
# It is NOT meant as a production ready image.
#
# If you have any ideas how to make it clearer or simpler, please send me an email, submit a PR or an Issue.
# If you have ideas about how to make it better, please consider one of this other repos:
# Mautic DKR Advanced. For production deployments. (Comming soon)
# Mautic DKR DEV. For development stacks. (Comming soon-er or later)
#
# We use ARGuments to parametrize the build-time parameters.
# While Debian is the only OS supported by this Dockerfile,
# you should be able to try other versions of Debian by adjusting the OS_VER ARG.
#
# This particular Dockerfile is intended for documentation.
# There is a properly optimized verion of this dockerfile without comments and RUN commands grouped.
#
# All the files for this dockerfile are on this GitHub repository:
# https://github.com/Martech-WorkShop/toolBelt

# Wich OS to use as the starting image
ARG BASE_OS=debian
ARG OS_VERSION=12-slim
# Effectively converted to: FROM debian:12-slim
FROM ${BASE_OS}:${OS_VERSION}

# Just some metadata...
LABEL vendor="KISS Mautic"
LABEL author="Yosu Cadilla from the Martech WorkShop at martech.ws <yosu.cadilla@gmail.com>"
LABEL github_repo="Martech-WorkShop/toolBelt"
LABEL dockerhub_image="kissmautic/easy-mautic:5.2.2"

#Prevent the CLI from asking questions during build time.
ARG DEBIAN_FRONTEND=noninteractive

# Define versions for the different components of the stack.
ARG PHP_VER=8.3
ARG MARIADB_VER=11.4
ARG MAUTIC_VER=5.2.2

# Define parameters for the Mautic database
ENV MAUTIC_DB_NAME=mautic-db
ENV MAUTIC_DB_USER=mautic-db-user
ENV MAUTIC_DB_PASSWORD=mautic-strong-password
ENV MAUTIC_LOGIN=ChangeMeRightNow!
ENV MAUTIC_LOGIN_PWD=ChangeMeRightNow!

# When building the image, you can override the default values using the --build-arg flag, example:
# docker run -d -e MAUTIC_DB_PASSWORD=my-db-password -p 80:80 dockerImageName


###--------------------------------###
###  Prepare for the installation  ###
###--------------------------------###

# Update the package lists and upgrade any packages to their latest version.
RUN apt update && apt upgrade -y

# Install necessary packages for installing other packages XD.
# wget for downloading files from the internet.
# gnupg2 for package verification.
# lsb-release: To determine the Debian version.
# ca-certificates for SSL/TLS verification.
# apt-transport-https to be able to use use HTTPS with apt repositories.
# curl for downloading files and making web requests.
RUN apt-get install -y wget curl gnupg2 lsb-release ca-certificates apt-transport-https \
    software-properties-common libhashkit2 ssl-cert snapd


# Download the GPG key for the PHP repository.
# This key is used to verify the integrity of the PHP packages we'll install.
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

# Add the PHP repository to the list of sources.
# This allows us to install specific PHP versions, even if not available in the default Debian repositories.
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

# Create a directory for APT keyrings.
# This is where we'll store the MariaDB GPG key.
RUN mkdir -p /etc/apt/keyrings

# Download the MariaDB GPG key.
# This key is used to verify the integrity of the MariaDB packages.
RUN curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

# Add the MariaDB repository to the list of sources.
# This allows us to install a specific version of MariaDB.
RUN echo "deb [signed-by=/etc/apt/keyrings/mariadb-keyring.pgp] \
    https://dlm.mariadb.com/repo/mariadb-server/${MARIADB_VER}/repo/debian \
    $(lsb_release -sc) main" > /etc/apt/sources.list.d/mariadb.list


###--------------------------------###
###   Install the stack packages   ###
###--------------------------------###

# Update package lists after adding new repositories.
# This ensures we have the latest information about packages in the newly added repositories.
RUN apt update && apt upgrade -y

# Install the components of the stack and other packages these require.
# Apache2: The HTTP server.
# fcgid: FastCGI module for Apache2, needed for PHP-FPM.
# MariaDB: MySQL compatible Database.
# ntp: Time service.
# openssl:
# Nano and Micro are text edtors
# Supervisor can be used to run services
# unzip: To extract zip files, like the mautic releases from GitHub.
RUN apt install -y sudo cron apache2 libapache2-mod-fcgid mariadb-server \
    ntp openssl unzip nano micro supervisor imagemagick graphicsmagick

# Install PHP and PHP Extensions required to run Mautic.
RUN apt install -y php-bcmath php-curl php-igbinary php-intl php-mbstring php-xml
RUN apt install -y php${PHP_VER}-fpm php${PHP_VER}-imap php${PHP_VER}-bcmath php${PHP_VER}-bz2 php${PHP_VER}-cli \
    php${PHP_VER}-common php${PHP_VER}-curl php${PHP_VER}-gd php${PHP_VER}-gmp php${PHP_VER}-igbinary \
    php${PHP_VER}-intl php${PHP_VER}-mbstring php${PHP_VER}-mysql php${PHP_VER}-readline php${PHP_VER}-phpdbg \
    php${PHP_VER}-xml php${PHP_VER}-zip php${PHP_VER}-soap php${PHP_VER}-xmlrpc php${PHP_VER}-tidy

# You can enable the following 2 instructions to make the image slightly smaller,
# however, you will have to run apt update to reload the cache if you want to install anything.
#    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
#    && rm /etc/cron.daily/*

# Set the installed PHP version as the default.
# This ensures that when we run 'php' commands, we use the version we just installed.
RUN update-alternatives --set php /usr/bin/php${PHP_VER}

# Enable the Apache2 modules.
RUN a2enmod proxy_fcgi setenvif rewrite expires headers http2 ssl actions alias
# Enable the Apache2 configuration.
RUN a2enconf php8.3-fpm
# Set the right MPM


###--------------------------------###
###       Get required files       ###
###--------------------------------###
# All the required files are on this repo:
# Meaning no COPY comands are required,
# You get the files from github instead.
# Get any files required to build this image.


# --->>   Configuration for components of the stack   <<---

# Configuration for Apache2
RUN wget -O  /etc/apache2/apache2.conf https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/apache/apache2.conf
# Configuration for Apache's Event MPM
RUN wget -O /etc/apache2/mods-enabled/mpm_event.conf https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/apache/mpm_event.conf
# Configuration for the Apache2 Vhost.
RUN wget -O /etc/apache2/sites-available/000-default.conf https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/apache/000-default.conf-8.3
# Configuration for FPM
RUN wget -O /etc/php/8.3/fpm/pool.d/www.conf https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/fpm/www.conf-8.3
# Configuration for PHP.
RUN wget -O /etc/php/8.3/fpm/php.ini https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/php/php.ini
RUN cp /etc/php/8.3/fpm/php.ini /etc/php/8.3/cli/php.ini
# Configuration for MariaDB
RUN wget -O /etc/mysql/mariadb.conf.d/50-server.cnf https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/mariadb/50-server.cnf


# --->>   Files for Mautic   <<---

# This file contains the Mautic cronjobs
RUN wget https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Mautic/conf/cron/cronjobs
COPY mauticdb-dump.sql /mauticdb-dump.sql
COPY local.php /var/www/html/config/local.php


# --->>   Make the CLI prettier   <<---

# This file makes your prompt sexier.
RUN wget -O ~/.bashrc https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Base/script/bashrc
# This file greets you when you login to your Mautic container.
RUN wget -O /usr/local/bin/hi5 https://raw.github.com/Martech-WorkShop/toolBelt/Prod/Base/script/hi5


# --->>   Docker related files   <<---

# This file contains the configuration for supervisor.
#RUN wget https://files.mktg.dev/pub/dkr/511/supervisord.conf -O /etc/supervisor/conf.d/supervisord.conf
# This is the Docker entrypoint script.
RUN wget https://files.mktg.dev/pub/dkr/511/start-8.3.sh
# This is the SQL commands to vreate the initial database.
# RUN wget https://files.mktg.dev/pub/dkr/511/init-db.sql


# --->>   Admin aliases and scripts   <<---

#RUN wget -O /usr/local/bin/virtHost
#RUN wget -O /usr/local/bin/tmautic
#RUN wget -O /usr/local/bin/tfpm8.2
#RUN wget -O /usr/local/bin/tfmautic
#RUN wget -O /usr/local/bin/tffpm8.1
#RUN wget -O /usr/local/bin/tfapache
#RUN wget -O /usr/local/bin/tfaccess
#RUN wget -O /usr/local/bin/tapache
#RUN wget -O /usr/local/bin/taccess
#RUN wget -O /usr/local/bin/permit
#RUN wget -O /usr/local/bin/mlocal
#RUN wget -O /usr/local/bin/mcache
#RUN wget -O /installSSLCert.sh

# --->>   Finalizing file import   <<---

# Give execution rights to scripts
RUN chmod +x /start-8.3.sh
RUN chmod +x /usr/local/bin/hi5
# Executing'm scripts
RUN crontab -u www-data cronjobs
# ... and clean up.
RUN rm cronjobs


###---------------------------------###
###    Ready Docker requirements    ###
###---------------------------------###

# Create directory for MariaDB data
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql

# Create a volume for MariaDB data
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
# Volume to hold the flag file, probably best located somewhere else?
VOLUME /var/lib/


# Create directory for PHP-FPM socket
# Ensure the PHP-FPM socket file is created
RUN touch /run/php/php8.3-fpm.sock
RUN chown -R www-data:www-data /run/php

# Copy initialization script
# COPY init-db.sql /docker-entrypoint-initdb.d/

# Expose MariaDB port and HTTP port
# EXPOSE 3306
EXPOSE 80

# Enable if you want one shared codebase for all cotainers.
#VOLUME /var/www/html/

# Define Mautic volumes to persist data
VOLUME /var/www/html/app/config
VOLUME /var/www/html/var/logs
VOLUME /var/www/html/media


###---------------------------------###
###   Download and install Mautic   ###
###---------------------------------###

# Set the working directory
WORKDIR /var/www/html

# Download Mautic.
RUN wget https://github.com/mautic/mautic/releases/download/${MAUTIC_VER}/${MAUTIC_VER}.zip

# Extract the Mautic archive.
RUN unzip ${MAUTIC_VER}.zip

# We don't need the zip file after extraction.
RUN rm ${MAUTIC_VER}.zip

# Set the correct ownership for the web files, ensures that the Apache process can read and write these files.
RUN chown -R www-data:www-data /var/www/html

# Set the correct permissions for directories.
# 755 allows the owner to read, write, and execute, and others to read and execute.
RUN find /var/www/html -type d -exec chmod 755 {} +

# Set the correct permissions for files.
# 644 allows the owner to read and write, and others to read.
RUN find /var/www/html -type f -exec chmod 644 {} +


###---------------------------------###
###     Cleanup and final steps     ###
###---------------------------------###

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Remove unused packages.
RUN apt-get autoremove -y

# The following are commented out for the sake of usability, enable these lines if you need a smaller image,
# This is only commented out in the "verbose" version of the Dockerfile, since you are expected to login
# into the container at some point. The production version will clear the cache by default.
# Clean the APT cache to further reduce image size.
#RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=60s --timeout=20s --retries=3 CMD \
service apache2 status && \
service php8.3-fpm status && \
service mariadb status && \
curl -f http://localhost \
|| exit 1


# Specify the command to run when the container is started.
# This starts MariaDB, PHP-FPM, Apache and keeps the container running.
CMD ["/start-8.3.sh"]


# ToDo:

# Parametrize PFP-FPM version in all files.

# Use Supervisord
# Add a mautic specific healthcheck with a curl call to the API.
# curl -f http://localhost/api/contacts?search=!is:anonymous&limit=1

#echo "         Does your DNS A record point at the IP of this server?"
#DIG_DOMAIN="$(dig +short $MAUTIC_DOMAIN | grep '^[.0-9]*$')"
#echo "         The DNS A record for" $MAUTIC_DOMAIN "points to the IP:"  $DIG_DOMAIN
#LOCAL_IP="$(curl -s ipinfo.io | grep -Po 'ip[^0-9]*"\K[^"]*')"
#echo "         This server's IP is: "$LOCAL_IP

#Finish the SSL cert script.

#Install SES plugin
#cd /path/to/your/mautic/plugins
#git clone https://github.com/yourusername/mautic-aws-ses-plugin.git AmazonSesBundle
#php /path/to/mautic/bin/console cache:clear
#https://github.com/pm-pmaas/etailors_amazon_ses?utm_source=email&utm_medium=mautic&utm_campaign=week42


# Point the file downloads to the github repo instead of the file server.
