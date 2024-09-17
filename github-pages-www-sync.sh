#!/bin/bash

git add --all

git commit -m '' --allow-empty-message

git push -u origin main

echo "Deployed to GitHub Pages"
