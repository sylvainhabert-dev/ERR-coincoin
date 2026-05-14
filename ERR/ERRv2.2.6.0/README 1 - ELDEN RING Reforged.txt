===================================================================
                     -~ ELDEN RING Reforged ~-
           an overhaul mod by Kirnifr & the Reforged team
===================================================================

ELDEN RING Reforged is an overhaul about giving the player a great variety of reasons to engage with the
game world, imagine and realize a compelling character fantasy through balanced and powerful build choices,
and refining ELDEN RING's combat system with rich, impactful moment-to-moment decisions and a variety
of tools at the player's disposal.

===================================================================
INSTALLATION
===================================================================

1)

Extract the mod to a location on your computer (preferably an SSD drive).

    !! Please DO NOT extract in any of the following folders: !!

    - your ELDEN RING game folder
    - your Downloads folder
    - your Desktop
    - anywhere that is being managed by OneDrive, Dropbox or similar tool

    Ideally, extract the mod to some simple folder path such as "C:\ERR".

2)

To launch the mod, run one of the "Launch ELDEN RING Reforged" file (the Launcher) in the main ERR folder.

    - Launch the "Online (Windows)" launcher for the default Reforged experience.
    - Launch the "Offline (Windows)" launcher if you wish to apply your own mods, or play with Seamless Coop.

The Launcher will lead you through any steps you need to do to finalize the installation.
The Launcher will also try to point out issues via warnings. Read them carefully.
After the initial installation, the launcher will simply launch the mod as you need it.

3)

If you wish to use Seamless Coop, or if you use Linux/Steam Deck, please read the other README files.

===================================================================
SAVE BACKUPS & RESTORING SAVE BACKUPS
===================================================================

The Reforged Launcher automatically backs up your save files. Up to 25 of your latest save files will be backed up.

To restore a save backup after something went wrong, you need to replace your current save with a backed-up version as follows:

- Visit the mod folder "troubleshooting\" and run the "Go to ELDEN RING Save Folder" shortcut.
- Open the folder with a name made up of numbers (your Steam ID).
- Open the folder called "ERR Backups".
- Pick the save file you want to restore, and *copy* it into the folder above (the one containing the "ERR Backups" folder).
- Rename your existing "ER0000.err" file in that folder to something else, or move it to a different location.
- Rename the backup save file you just copied to "ER0000.err".

You can now launch the game with the restored backup.

===================================================================
TROUBLESHOOTING
===================================================================

If you encounter problems while running the Reforged launcher, the launcher will typically
try to give you suggestions on what you can do. Most error cases should be covered by this.

Please read any warnings given by the launcher very carefully, and follow any instructions within.
Please make sure to re-read the installation instructions very carefully as well.

Should issues persist, or should the Launcher spit out errors, please contact us at the Reforged discord (see end of file).

===================================================================
ALTERNATE CONTROLLER UI LAYOUTS
===================================================================

Reforged comes with some alternate UI prompts for the PS4, PS5 and Switch controllers.
You can install or reset them by running the right shortcut in the "extras" folder.

===================================================================
UPDATING TO A NEW VERSION
===================================================================

There is no special procedure to updating. Your saves are stored in a separate location.

Simply unpack the mod files in the same location as before, and make sure to overwrite everything.

If you aren't being asked to overwrite anything when unpacking in the same location,
you are probably not unpacking in the same location.

Alternately, you can unpack the new version to another location.

===================================================================
ADDING ADDITIONAL MODS
===================================================================

WARNING: The majority of mods in ELDEN RING are fundamentally incompatible with one another.
These following instructions should only be used with mods which are guaranteed to be compatible,
such as simple cosmetic model changes (weapon models, character models).

If you want to load additional mods after Reforged, you can do so simply by adding them to the
"addons" folder in the Reforged folder.

For each separate mod you add, you should create a separate folder, such as:

- addons\My First Mod\
- addons\My Second Mod\

Then, the mod should be installed inside that newly created folder, for instance:

- addons\My First Mod\parts\WP_A_1234.partsbnd.dcx

Adding mods to the "addons" folder in this manner will cause the Launcher to automatically add them to the game.

===================================================================
ADDING DLL MODS
===================================================================

If you want to add DLL mods like Posture Bar and Erd Tools, you can do so simply by adding them
to one of the following folders in the Reforged folder.

- For Online Mode (on the Reforged server): dll\online
- For Offline Mode (for Seamless Coop and offline play): dll\offline

Adding the DLLs to that folder will cause the Launcher to automatically add them to the game.

A number of tweaked DLLs which work with Reforged is available in "dll\optional".
To add them to your game, simply move them (along with related files) to the correct "dll\online"
or "dll\offline" folder.

Do not use Elden Mod Loader for this purpose. It will likely cause issues with Reforged.

===================================================================
CUSTOMIZATION (For advanced users)
===================================================================

ELDEN RING Reforged bundles its own installation of me3 (sometimes falsely called ModEngine 3) to run the mod.

The Launcher EXE tries to include the DLL files from the "dll" folder, as well as addons from the "addons" folders,
when creating the mod profile for me3. This configuration is overridden every launch.

It is not advised to modify the me3 installation or any bundled DLLs to maintain proper function, as the
Reforged me3 version could either be custom, or based on a certain me3 fork at any given time.

If you wish to launch the mod from Steam via non-game shortcut, you may directly call "internals\launcher\ReforgedLauncher.exe"
for the shortcut.

===================================================================
MIGRATING EXISTING SAVES (Vanilla or older versions)
===================================================================

To avoid issues with the official Fromsoft servers, Reforged uses a separate save file.

The Reforged Launcher EXE will attempt to migrate your saves automatically.

If not:

The save files are saved in the ELDEN RING AppData folder.

If you wish to bring your own saves into ELDEN RING Reforged, you need to copy them
and rename them to the new save extension ".err".

How to access your save files:

- Visit the mod folder "troubleshoot\" and run the "Go to ELDEN RING Save Folder" shortcut.
- Open the folder with a name made up of numbers (your Steam ID).
- Find your existing save:
    - ER0000.sl2 for Vanilla
    - ER0000.co2 for Seamless Coop
    - ER0000.mod for Alt Saves
- Copy your existing save and rename it to "ER0000.err".
    If you can't see the file extension, find the "File Explorer Options" in Windows (use Google if necessary),
    and in the "View" tab, uncheck the box that says "Hide extensions for known file types".

Running the "Launch ELDEN RING Reforged" EXE should now display your previous saves.

===================================================================
WIKI, INFORMATION & FEEDBACK
===================================================================

A work-in-progress wiki for info on changes made in ERR:

https://err.fandom.com/wiki/ELDEN_RING_Reforged_Wiki

You can provide feedback on the mod, and ask for technical support, on our Discord server:

https://discord.gg/pTkPMSdfKm

Some information is also available on our NexusMods page:

https://www.nexusmods.com/eldenring/mods/541

===================================================================
SUPPORT THE MOD
===================================================================

You can support development here on Ko-Fi if you want:

https://ko-fi.com/kirnifr (Project director, lead developer)
https://ko-fi.com/ividyon (Co-director, programmer, wearer of many hats)

===================================================================
CREDITS
===================================================================

A lot of people have contributed to Reforged over the years.
You can find the full credits list in the separate CREDITS.txt file.