#!/usr/bin/env bash

icon_off="⚋ "
icon_1="⚊ "
icon_2="⚍ "
icon_3="⚌ "
icon_4="☱ "
icon_5="☰ "

print_icon() {
  local strength=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep -e "CtlRSSI" | awk -F '-' '{print $2}')
  if [[ -z "$strength" ]]; then
    printf "$icon_off"
  elif [[ $strength < 50 ]]; then
    printf "$icon_5"
  elif [[ $strength < 60 ]]; then
    printf "$icon_4"
  elif [[ $strength < 70 ]]; then
    printf "$icon_3"
  elif [[ $strength < 80 ]]; then
    printf "$icon_2"
  elif [[ $strength < 90 ]]; then
    printf "$icon_1"
  fi
}

main() {
  print_icon
}

main
