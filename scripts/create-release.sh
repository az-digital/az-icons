#!/bin/sh
#------------------------------------------------------------------------------
#
# create-release.sh: prepare a release
#
# Required environment variables
# - AZ_ICONS_SOURCE_DIR Source directory for files and directories
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
logmessage () {
  if [ -z "$AZ_QUIET" ]; then
    echo "$1..." >&2
  fi
}
normalexit () {
  if [ -z "$AZ_QUIET" ]; then
    echo "$1." >&2
  fi
  exit 0
}

#------------------------------------------------------------------------------
# Initial run-time error checking.

[ -n "$AZ_ICONS_SOURCE_DIR" ] \
  || errorexit "No source directory specified"
[ -d "$AZ_ICONS_SOURCE_DIR" ] \
  || errorexit "Couldn't find the source directory ${AZ_ICONS_SOURCE_DIR}"
[ -n "$AZ_RELEASE_VERSION" ] \
  || errorexit "No new version specified for the release"

#------------------------------------------------------------------------------
# Set up with the old saved npm configuration.

copy-npm-config

cd "$AZ_ICONS_SOURCE_DIR" \
  || errorexit "Can't change to the ${AZ_ICONS_SOURCE_DIR} directory holding the files for the release"

npm version --unsafe-perm --no-git-tag-version "${AZ_RELEASE_VERSION}" \
  || errorexit "Failed to bump the version number to ${AZ_RELEASE_VERSION}"

logmessage "Bumped the version to ${AZ_RELEASE_VERSION}"

normalexit "Copied saved versions of package.json and package-lock.json, bumped the version to ${AZ_RELEASE_VERSION}"
