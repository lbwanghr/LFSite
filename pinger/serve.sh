#!/bin/bash
cd "$(dirname "$0")"
echo "Working directory: $(pwd)"
bundle exec jekyll serve --baseurl ""
