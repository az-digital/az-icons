FROM node:14.16.0-buster-slim

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
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    rsync \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install 'awscli~=1.19.41' \
  && cd "${AZ_ICONS_FROZEN_DIR}" \
  && npm config set cache='/tmp/.npm' \
  && chmod 755 /root \
  && chmod 644 /root/.npmrc \
  && npm install -g npm-check-updates@12.0.0 \
  && npm install \
  && find node_modules -name '.DS_Store' -exec rm {} \;