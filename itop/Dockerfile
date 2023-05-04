FROM debian:11.6

LABEL org.opencontainers.image.authors="Aiden Arnkels-Webb"

# Set non-interactive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install core dependencies
RUN apt update \
    && apt install --yes --no-install-recommends \
    wget \
    apt-transport-https \
    lsb-release \
    ca-certificates

#Add Sury repository for PHP 8.1
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

# Install Webserver
RUN apt update \
    && apt upgrade --yes \
    && apt install --yes --no-install-recommends \
    apache2 \
    php8.1 \
    php8.1-mysql \
    php8.1-ldap \
    php8.1-mcrypt \
    php8.1-cli \
    php8.1-soap \
    graphviz \
    php8.1-xml \
    php8.1-gd \
    php8.1-zip \
    libapache2-mod-php \
    && rm -rf /var/lib/apt/lists