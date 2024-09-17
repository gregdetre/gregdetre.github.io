#!/bin/bash

git pull

git add --all

# https://claude.ai/chat/15e5236b-0746-4c58-9046-b1841123e3c1
# Check if a commit message was provided as an argument
if [ $# -eq 0 ]; then
    # If no argument, use an empty commit message
    git commit -m '' --allow-empty-message
else
    # If an argument is provided, use it as the commit message
    git commit -m "$1"
fi

git push -u origin main

echo "Deployed to GitHub Pages"
