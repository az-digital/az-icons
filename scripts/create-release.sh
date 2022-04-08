#!/bin/sh
#------------------------------------------------------------------------------
#
# create-release.sh: prepare a release
#
# Required environment variables
# - AZ_RELEASE_VERSION New release version
#
#------------------------------------------------------------------------------

set -e

#------------------------------------------------------------------------------
# Utility function definitions.

errorexit () {
  echo "** $1." >&2
  exit 1
}

# Show progress on STDERR, unless explicitly quiet.
if [ -z "$AZ_QUIET" ]; then
  logmessage () {
    echo "$1..." >&2
  }
  normalexit () {
    echo "$1." >&2
    exit 0
  }
else
  logmessage () {
    return
  }
  normalexit () {
    exit 0
  }
fi

#------------------------------------------------------------------------------
# Initial run-time error checking.

[ -n "$AZ_RELEASE_VERSION" ] \
  || errorexit "No new version specified for the release"

#------------------------------------------------------------------------------
# Set up with the old saved npm configuration.

copy-npm-config

npm version --unsafe-perm --no-git-tag-version ${AZ_RELEASE_VERSION} \
  || errorexit "Failed to bump the version number to ${AZ_RELEASE_VERSION}"

normalexit "Copied saved versions of package.json and package-lock.json, bumped the version to ${AZ_RELEASE_VERSION}"
