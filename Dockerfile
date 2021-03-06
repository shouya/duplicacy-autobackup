FROM ghcr.io/linuxserver/baseimage-alpine:3.13

MAINTAINER Christophe Tafani-Dereeper <christophe@tafani-dereeper.me>

#--
#-- Build variables
#--
ARG DUPLICACY_VERSION=2.7.2

#--
#-- Environment variables
#--

ENV BACKUP_SCHEDULE='* * * * *' \
    BACKUP_NAME='' \
    BACKUP_LOCATION='' \
    BACKUP_ENCRYPTION_KEY='' \
    BACKUP_IMMEDIATLY='no' \
    BACKUP_IMMEDIATELY='no' \
    DUPLICACY_BACKUP_OPTIONS='-threads 4 -stats' \
    DUPLICACY_INIT_OPTIONS='' \
    AWS_ACCESS_KEY_ID='' \
    AWS_SECRET_KEY='' \
    WASABI_KEY='' \
    WASABI_SECRET='' \
    B2_ID='' \
    B2_KEY='' \
    HUBIC_TOKEN_FILE='' \
    SSH_PASSWORD='' \
    SSH_KEY_FILE='' \
    DROPBOX_TOKEN='' \
    AZURE_KEY='' \
    GCD_TOKEN='' \
    GCS_TOKEN_FILE='' \
    ONEDRIVE_TOKEN_FILE='' \
    PRUNE_SCHEDULE='0 0 * * *' \
    DUPLICACY_PRUNE_OPTIONS=''

#--
#-- Other steps
#--
RUN apk --no-cache add ca-certificates curl && update-ca-certificates
RUN wget https://github.com/gilbertchen/duplicacy/releases/download/v${DUPLICACY_VERSION}/duplicacy_linux_x64_${DUPLICACY_VERSION} -O /usr/bin/duplicacy && \
    chmod +x /usr/bin/duplicacy

COPY root /

WORKDIR /data

VOLUME ["/data"]
