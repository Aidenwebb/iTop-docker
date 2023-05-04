FROM debian:11.6

LABEL org.opencontainers.image.authors="Aiden Arnkels-Webb <github@aidenwebb.com>"

# Set iTop version
ARG ITOP_VERSION=3.0.3
ARG ITOP_FILENAME=iTop-3.0.3-10998.zip


# Set non-interactive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install core dependencies
RUN apt update \
    && apt install --yes --no-install-recommends \
    curl \
    wget \
    unzip \
    apt-transport-https \
    lsb-release \
    ca-certificates

#Add Sury repository for PHP 8.0
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

# Install Webserver
RUN apt update \
    && apt upgrade --yes \
    && apt install --yes --no-install-recommends \
    apache2 \
    php8.0 \
    php8.0-mysql \
    php8.0-ldap \
    php8.0-cli \
    php8.0-soap \
    graphviz \
    php8.0-xml \
    php8.0-gd \
    php8.0-zip \
    php8.0-mbstring \
    libapache2-mod-php \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists \
    && update-alternatives --set php /usr/bin/php8.0

# Clean apache2 default page
RUN rm -rf /var/www/html/*

# Install iTop
WORKDIR /usr/local/src

RUN curl -sSL https://sourceforge.net/projects/itop/files/itop/$ITOP_VERSION/$ITOP_FILENAME/download -o $ITOP_FILENAME \
    && unzip $ITOP_FILENAME -d itop \
    && rm $ITOP_FILENAME \
    && mv itop/web/* /var/www/html/ \
    && rm -rf itop

COPY /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /

COPY /run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

ENTRYPOINT [ "/run.sh" ]