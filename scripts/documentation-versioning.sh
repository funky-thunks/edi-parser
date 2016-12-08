#!/usr/bin/env bash

# This is the initial commit of this project.
# This is useful to list content of the first tagged version.
rootCommit="c468e930cf7f15c709bf8890f197135a62858f16"

function parentTag {
  local tag=$1
  git describe --abbrev=0 --tags "${tag}^" 2>/dev/null || echo "${rootCommit}"
}

function prettyLogUndocumentedTag {
  local tag=$1;
  cat <<-HTML
    <dt>
      <h2>
        (${tag}) Not generated
      </h2>
    </dt>
	HTML
}

function gitAuthor {
  local tag="$1"
  git log -n1 --pretty="%an" "${tag}"
}

function linkToTaggedDocumentation {
  local tag="$1"
  cat <<-HTML
    <a href="${tag}/index.html">
      <button>
        <small>Go to </small>
        <strong>${tag}</strong>
        <small> released by </small>
        <strong>$(gitAuthor "${tag}")</strong>
      </button>
    </a>
	HTML
}

function contentOfTaggedDocumentation {
  local tag=$1;
  local content
  content=$(git log --pretty="%ad | %h | %s" --date=short "$(parentTag "${tag}")..${tag}")
  echo "<pre>${content}</pre>"
}

function prettyLogTag {
  local tag=$1
  cat <<-HTML
    <dt>$(linkToTaggedDocumentation "${tag}")</dt>
    <dd>$(contentOfTaggedDocumentation "${tag}")</dd>
	HTML
}

function formatTags {
  local webRoot="$1"
  while read -r tag
  do
    if [ -d "${webRoot}/${tag}" ]
    then
      prettyLogTag "$tag"
    else
      prettyLogUndocumentedTag "$tag"
    fi
  done
}

function listTags {
  git tag --list "v20??-??-??" --sort="-refname"
}

function generateIndex {
  local webRoot="$1"
  cat <<-HTML
    <!DOCTYPE html>
    <html>
      <meta charset="UTF-8">
      <head>
        <link rel="stylesheet" href="https://cdn.rawgit.com/yegor256/tacit/gh-pages/tacit-css-1.3.4.min.css"/>
      </head>
      <body>
        <section>
          <article>
              <h1>Available documentations</h1>
              <hr>
              <dl>
                  $(listTags | formatTags "${webRoot}")
              </dl>
            </section>
          </article>
        </section>
      </body>
    </html>
	HTML
}

function generateDoc {
  local webRoot="$1"
  local currentTag="$2"
  local docRoot="$3"
  local tagWebRoot="${webRoot}/${currentTag}"
  if [[ -z "$webRoot" ]]
  then
    echo "Undefined webRoot directory"
    exit 1
  fi
  if [[ -z "$currentTag" ]]
  then
    echo "Undefined current tag"
    exit 1
  fi
  if [[ -z "$docRoot" ]]
  then
    echo "Undefined documentation root"
    exit 1
  fi
  echo "Documentation root: ${docRoot}"
  mkdir -p "${webRoot}";
  cp -r "${docRoot}" "${tagWebRoot}"
  generateIndex "${webRoot}" > "${webRoot}/index.html"
}

generateDoc "$1" "$2" "$3"
