#!/usr/bin/env bash

ARTIST=$(cat ~/Library/Application\ Support/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | jq -r .song.artist | cut -c-15)
TITLE=$(cat ~/Library/Application\ Support/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | jq -r .song.title | cut -c-25)

if [[ $ARTIST != *"null"* || $TITLE != *"null"* ]]; then
  echo -n "♫ $ARTIST - $TITLE"
fi

