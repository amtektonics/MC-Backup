# MC-Backup


A simple backup script that will backup a Minecraft server while it is running

`StartTmuxServer.sh` is built to start a Minecraft server in tmux that can then be accessed with the `SaveServer.sh` script.
`SaveServer.sh` when run will disable saving on the server pack up the current world folder into  a tar.gz with a timestamp.


To use these scripts some parameters in the scripts will need to be changed to fit your needs

In `StartTmuxServer.sh` `<server name>` will need to be change to what you want your tmux session name to be called, and `server launch code` will be your jar launch parameters.

In `SaveServer.sh` you will need to add an absolute path of your Minecraft directory after the `cd` command on the second line

`session` parameter will be the same at `<server name>` in `StartTmuxServer.sh`

`levelName` is the world name of your Minecraft server

`numberOfBackups` is how many backups you would like to keep in your backup directory

`sleepDelay` is how long the process will wait after saving the current server state before backing up the world folder



How you run this script is up to you but I personally use the `crontab -e` command on linux and will run the script with the parameters `0 */6 * * * <absolute path to SaveServer.sh>` This will make a backup of the 6 time everyday starting at 0:00(midnight)
