#!/bin/bash
set -e
timestamp=$(date +"%Y-%m-%d")
git tag pre-gitbot-"$timestamp" pre-gitbot
git tag post-gitbot-"$timestamp" post-gitbot
git push origin pre-gitbot-"$timestamp" post-gitbot-"$timestamp"
git tag -d pre-gitbot post-gitbot
git push --delete origin pre-gitbot post-gitbot
git tag | grep gitbot-backup | tee >(xargs git tag -d >/dev/null 2>&1) | xargs git push --delete origin