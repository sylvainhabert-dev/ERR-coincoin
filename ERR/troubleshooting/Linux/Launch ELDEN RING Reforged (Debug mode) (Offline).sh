#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")

if ! chmod +x "$script_dir/../../internals/launcher/ReforgedLauncher" ; then
  echo "Could not set executable rights for the Reforged Launcher."
  echo "From this folder, please execute 'chmod +x internals/launcher/ReforgedLauncher'."
  read -p "Press enter to exit..."
  exit 1
fi

if ! chmod +x "$script_dir/../../internals/modengine/bin/me3" ; then
  echo "Could not set executable rights for me3."
  echo "From this folder, please execute 'chmod +x internals/modengine/bin/me3'."
  read -p "Press enter to exit..."
  exit 1
fi

if ! chmod +x "$script_dir/../../mod/menu/deploy/Gideon" ; then
  echo "Could not set executable rights for the Gideon program."
  echo "From this folder, please execute 'chmod +x mod/menu/deploy/Gideon'."
  read -p "Press enter to exit..."
  exit 1
fi

"$script_dir/../../internals/launcher/ReforgedLauncher" --offline --debug