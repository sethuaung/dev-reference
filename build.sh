#!/usr/bin/bash
# Usage: [git-repo-url] [website-title]
# Those values can also be set via environment variables:
# $DOCS_REPO and $DOCS_NAME

# Change into the script's directory
# This is really important, since this script modifies (and deletes) files by relative paths
cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")"

# If this script is executed locally, the folders created by the last run should be deleted.
# Thus local and remote builds will (hopefully) not have different results
rm -rf docs public mkdocs.yml

# Determine the repos name:
NAME=${2:-$DOCS_NAME}
NAME=${NAME:-My Documents}
echo "[build.sh] Using website name: $NAME"

# Create the mkdocs.yml by replacing the name placeholder with the user supplied value
sed "s/<NAME>/$NAME/" mkdocs-template.yml > mkdocs.yml

# Determine which repo the git documents should be obtained from
# Preference order: Command line argument, environment variable, my hardcoded demo page URL
REPO=${DOCS_REPO:-https://github.com/six-two/notes-demo-page}
REPO=${1:-$REPO}

if [[ -d "${REPO}" ]]; then
  # allows using a local folder for more flexible use (and for easy local testing)
  echo "[build.sh] Using docs folder: ${REPO}"
  # Copy the folder to use it as the docs folder
  cp -r "${REPO}" docs
else
  echo "[build.sh] Using docs repo: ${REPO}"
  # Download the document repo to the docs folder
  git clone "${REPO}" docs
fi

echo "[build.sh] Installing dependencies"
# Install the static site generator and the theme
pip install mkdocs mkdocs-material mkdocs-minify-plugin mkdocs-autolinks-plugin


# Delete the README.md file, since it often contains unnecessary stuff, such as installation instructions.
# If you want an index page, create a file called 'index.md' instead.
rm docs/README.md
# if no index.md file exists, create an empty page
if [ ! -f docs/index.md ]; then
  cat << EOF > docs/index.md
# ${NAME}

## Navigating
On the left side, you can see a list of all pages.
On the right side, you can see the different sections of the current page.
Click on any of the sections to jump there.

## Searching
You can also search this page.
Just type \`/\` or click on the search bar at the top right corner te start searching.
EOF
fi

# if no tags.md file exists, create an standard one
if [ ! -f docs/tags.md ]; then
  cat << EOF > docs/tags.md
# Find a page by tag
The following tags are defined. Use the table of contents on the right side to jump
to the tag you are interested in:
[TAGS]
EOF
fi

echo "[build.sh] Building site"
# Build the site. The result will be written in the ./public directory
mkdocs build -d public

echo "[build.sh] Done"
