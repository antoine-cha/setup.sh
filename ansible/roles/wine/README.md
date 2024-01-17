# Wine
> [!WARNING]
> This role only works on **Ubuntu 22.04**

Role to install Wine

## Post-installation steps
* Reboot your machine
* Setup params with `winecfg` for each piece of software
* Launch games or tools with `WINEPREFIX="/home/antoine/.wine/"; wine $GAME_EXE`