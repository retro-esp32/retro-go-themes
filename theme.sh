#!/bin/bash

#---------------------------------
# Styles
#---------------------------------
source styles.sh

PREFIXES=("background" "banner" "logo")
SYSTEMS=("2600" "col" "collections" "doom" "favorite" "gb" "gbc" "gg" "gw" "lnx" "md" "nes" "pce" "recent" "sms" "snes" "themes")
SIZES=("320x240" "274x24" "46x50")
BACKGROUNDS=("white" "magenta" "black" "transparent")
BACKGROUND

LINE="=======================================================\n"

MESSAGE="\n${bold}${game}  ${red}T${green}h${blue}e${magenta}m${cyan}e${white} Creator${nc}\n"
MESSAGE="${MESSAGE}\n"
MESSAGE="${MESSAGE}"

background() {
  clear
  echo -e "${LINE}${MESSAGE}${LINE}"
  echo -e "Select a background color:"
  select BACKGROUND in "${BACKGROUNDS[@]}"
  do
    case $BACKGROUND in
      * )
        if [[ $BACKGROUND[0,1] ]]
        then
          clear
          echo -e "${LINE}${MESSAGE}${LINE}"
          echo -e "Select a background color: ${BACKGROUND}"
          break
        else
          background
        fi
    esac
  done
}

clear
echo -e "${LINE}${MESSAGE}${LINE}"
echo -e "Are you ready to create a custom theme? [y/${bold}${white}N${nc}]"

read -n 1 -r response

if [[ "$response" = "y" ]]
then
  clear
  echo -e "${LINE}${MESSAGE}${LINE}"
  echo -e "Please enter a theme name:"
  read theme
  clear
  echo -e "${LINE}${MESSAGE}${LINE}"
  echo -e "Creating theme with name: ${theme}"

  mkdir themes/${theme}
  cd themes/${theme}

  background

  for i in "${!PREFIXES[@]}";
  do
      PREFIX=${PREFIXES[i]}
      SIZE=${SIZES[i]}

      for SYSTEM in "${SYSTEMS[@]}"
      do
        FILE="${PREFIX}_${SYSTEM}"
        convert -size ${SIZE} canvas:${BACKGROUND} PNG32:${FILE}.png
      done
  done

  clear
  echo -e "${LINE}${MESSAGE}${LINE}"
  echo -e "Thank you!"

else
  clear
  exit
fi