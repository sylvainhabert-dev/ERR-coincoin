#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")

if ! chmod +x "$script_dir/../../mod/menu/deploy/Gideon" ; then
  echo "Could not set executable rights for the Gideon program."
  echo "From this folder, please execute 'chmod +x ../../mod/menu/deploy/Gideon'."
  read -p "Press enter to exit..."
  exit 1
fi

"$script_dir/../../mod/menu/deploy/Gideon" --user --project "PS4UIforModsbylosh11"
