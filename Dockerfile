FROM --platform=linux/amd64 node:20.16.0-bookworm-slim

ENV LANG C.UTF-8

COPY scripts/copy-npm-config.sh /usr/local/bin/copy-npm-config
COPY scripts/create-release.sh /usr/local/bin/create-release

# Build args don't normally persist as environment variables.
ARG AZ_ICONS_FROZEN_DIR
ENV AZ_ICONS_FROZEN_DIR ${AZ_ICONS_FROZEN_DIR:-/azbuild/az-icons}
ARG AZ_ICONS_SOURCE_DIR
ENV AZ_ICONS_SOURCE_DIR ${AZ_ICONS_SOURCE_DIR:-/az-icons-src}

# Silence warnings from the update-notifier npm package.
ENV NO_UPDATE_NOTIFIER 1

WORKDIR $AZ_ICONS_SOURCE_DIR

COPY "package.json" "$AZ_ICONS_FROZEN_DIR"/

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
  ca-certificates-java \
  curl \
  git \
  jq \
  openjdk-17-jre-headless \
  rsync \
  unzip \
  && rm -rf /var/lib/apt/lists/* \
  && chmod 755 /root \
  && touch /root/.npmrc \
  && chmod 644 /root/.npmrc \
  && npm install --location=global npm-check-updates@16.14.12 \
  && curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o /tmp/awscliv2.zip \
  && unzip -d /tmp /tmp/awscliv2.zip \
  && /tmp/aws/install \
  && rm /tmp/awscliv2.zip \
  && rm -Rf /tmp/aws

WORKDIR $AZ_ICONS_FROZEN_DIR

RUN mkdir /home/node/.npm \
  && chown node:node /home/node/.npm \
  && npm config set cache='/home/node/.npm' \
  && npm install \
  && find node_modules -name '.DS_Store' -exec rm {} \; \
  && chown -R node:node "$AZ_ICONS_FROZEN_DIR"

USER node:node

WORKDIR $AZ_ICONS_SOURCE_DIR
