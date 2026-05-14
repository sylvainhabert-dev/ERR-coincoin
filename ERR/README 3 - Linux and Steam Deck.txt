===================================================================
ELDEN RING Reforged Compatibility: Linux / Steam Deck
===================================================================
ELDEN RING Reforged is fully functional on Linux and Steam Deck!

The following instructions are written assuming you are using the Steam Deck.
Otherwise, you'll have to install Steam and Proton, and generally get Linux gaming underway as it is on the Deck.

If you're on the Steam Deck, you will probably want to perform this setup in Desktop mode. A keyboard will also be handy.

===================================================================
INSTRUCTIONS
===================================================================

Please carefully follow these instructions from top to bottom.
After this initial setup, you will be able to easily run the mod.

1) Install ELDEN RING on Steam.

2) Run the vanilla ELDEN RING game at least once.

3) Unpack ELDEN RING Reforged in a location of your choosing, to which you have adequate permissions.

4) Grant executable access to the two "Launch ELDEN RING Reforged" .sh shell script files in the main folder.

5) Right-click and "Run in Terminal" (or whatever equivalent of your desktop environment) your desired shell script file.

=== OPTIONAL: IF YOU WISH TO RUN THE MOD IN STEAM DECK "GAMING MODE" OR STEAM "BIG SCREEN" ===

6) Launch the mod via point 5) at least once, in Desktop Mode.

7) Add your preferred launcher .sh script as a Non-Steam Game Shortcut in Steam.
   Do NOT specify any Proton compatibility tools for this shortcut.

8) In the right-click properties of your new shortcut, wrap the "Target" path in double quotes.

Example:

    /home/myname/ERR/3 - Launch ELDEN RING Reforged - Online (Linux).sh

    to

    "/home/myname/ERR/3 - Launch ELDEN RING Reforged - Online (Linux).sh"

9) Repeat step 8) for the "Start In" path.

10) Depending on your Linux distribution, change the shortcut's Launch Options to
    call the .sh file through your console instead of running it directly.

Example for Steam Deck and KDE:

    konsole -e %command%

Depending on your distro, you must replace "konsole" with your respective terminal app, such as "ptyxis".

=== OPTIONAL END ===

11) Enjoy the game.

===================================================================
UPDATING THE MOD
===================================================================

To update the mod, you simply overwrite the existing files with the new ones.

To clarify, if you first installed the mod in the folder "ERRv1.0.0", and you wish to update to 1.1.0, you need to
unpack the files inside the archive's "ERRv1.1.0" folder into your existing "ERRv1.0.0" one, and overwrite the files.
If your OS isn't asking you whether it's OK to overwrite files, you probably didn't do it correctly.

Doing it this way, you don't have to set up a new Non-Steam Game shortcut, and can continue using the
existing one.

===================================================================
SAVE FILES
===================================================================

On Linux, the location of your ELDEN RING save files is:

    /home/<your user name>/.steam/steam/steamapps/compatdata/1245620/pfx/drive_c/users/steamuser/AppData/Roaming/EldenRing

If a game is installed on a different drive, the compatdata folder will be relative to the Steam folder
at that drive.

The App ID for ELDEN RING is "1245620", so that is the name of the "compatdata" folder where you'll find your
ELDEN RING save files.

===================================================================
KNOWN ISSUES
===================================================================

- The Steam Deck has a 16:10 resolution, which is not supported by ELDEN RING by default, leading to small issues with the UI.
