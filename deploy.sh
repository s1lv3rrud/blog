#!/bin/sh
# If a command fails then the deploy stops
set -e

# Print a status message
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the Hugo project
####### Update with your theme if necessary #######
hugo -t hugo-theme-stack

# Check if Hugo build was successful
if [ $? -ne 0 ]; then
  echo "Hugo build failed. Exiting deployment."
  exit 1
fi

# Add and commit changes in the main repository (blog content and config updates)
git add .
msg="Rebuilding site $(date)"
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"
git push origin main

# No need to manually push to the public folder; GitHub Actions will handle deployment
printf "\033[0;32mDeployment to GitHub complete. GitHub Actions will handle the deployment to Pages.\033[0m\n"