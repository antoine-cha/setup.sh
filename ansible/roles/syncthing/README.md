# Syncthing
> [!WARNING]
> This role only works on **Ubuntu 22.04**

Role to set up `syncthing` to sync a folder between machines.

On Linux, the default folder to sync is  `$HOME/Sync`.

## Post-installation steps
* Check the service is running with `systemctl status syncthing@$USER.service`
* Check the GUI is running at `http://127.0.0.1:8384`
* Share device IDs to sync machines