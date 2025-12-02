#!/bin/bash
set -eo pipefail

echo "Welcome to Madame Zelda's Magic Ball!"

# Check if arguments are provided, otherwise prompt interactively
if [ "${#}" -ge 2 ]; then
  mood="$1"
  theme="$2"
else
  echo "Enter your mood (grumpy, poetic, festive, sarcastic, mysterious, or funny): "
  read -r mood
  echo "Enter your theme (seasonal, magical, holiday, birthday, or random): "
  read -r theme
fi

# Validate that mood and theme are not empty
if [ -z "${mood:-}" ] || [ -z "${theme:-}" ]; then
  echo "Error: mood and theme must be provided" >&2
  exit 1
fi

goose run --recipe magic_ball_recipe.yaml --params mood="$mood" --params theme="$theme" > "${mood}_${theme}.md"
