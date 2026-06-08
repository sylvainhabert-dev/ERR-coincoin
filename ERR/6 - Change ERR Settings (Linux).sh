#!/usr/bin/env bash

script_dir=$(dirname "$(realpath "$0")")

#echo "Checking permissions on executables..."
if ! chmod +x "$script_dir/internals/launcher/ReforgedLauncher" ; then
  echo "Could not set executable rights for the Reforged Launcher."
  echo "From this folder, please execute 'chmod +x internals/launcher/ReforgedLauncher'."
  read -rp "Press any key to exit..."
  exit 1
fi
if ! chmod +x "$script_dir/internals/modengine/bin/me3" ; then
  echo "Could not set executable rights for me3."
  echo "From this folder, please execute 'chmod +x internals/modengine/bin/me3'."
  read -rp "Press any key to exit..."
  exit 1
fi
if ! chmod +x "$script_dir/mod/menu/deploy/Gideon" ; then
  echo "Could not set executable rights for the Gideon executable."
  echo "From this folder, please execute 'chmod +x mod/menu/deploy/Gideon'."
  read -rp "Press any key to exit..."
  exit 1
fi

launch="$(realpath "$script_dir/internals/launcher/ReforgedLauncher")"
#echo "Launch path is: $launch"
launch_args="--settings"
#echo "Launch arguments are: $launch_args"

if [ -n "${STEAM_RUNTIME}" ]; then
  #echo "Launching through Steam, finding local terminal emulator..."
  terms=(ptyxis konsole gnome-terminal x-terminal-emulator console gnome-console ghostty tabby kitty alacritty terminator tilda guake stjerm yakuake eterm roxterm aterm wterm byobu xterm terminology kgx)
  for t in "${terms[@]}"
  do
      if [ "$(command -v "$t")" ]
      then
          detected_term=$t
          break
      fi
  done
  #echo "Found terminal: $detected_term"
  if [ -n "${detected_term}" ]; then
    #echo "Launching Reforged launcher through terminal..."
    if ! "$detected_term" -e "$launch" $launch_args ; then
      echo "Could not launch Reforged launcher."
      echo "Please report this issue on the Reforged Discord, in the #tech-support channel:"
      echo "https://discord.gg/eldenringreforged"
      read -rp "Press any key to exit..."
      exit 1
    fi
  else
      echo "Could not detect fitting terminal."
      echo "Your system is using a terminal emulator which is not recognized by the script."
      echo "Please edit the .sh file directly to add your terminal emulator to the \"terms\" variable."
      read -rp "Press any key to exit..."
      exit 1
  fi
else
  #echo "Launching Reforged launcher:" "$launch" $launch_args
  if ! "$launch" $launch_args ; then
      echo "Could not launch Reforged launcher."
      echo "Please report this issue on the Reforged Discord, in the #tech-support channel:"
      echo "https://discord.gg/eldenringreforged"
      read -rp "Press any key to exit..."
      exit 1
  fi
fi
