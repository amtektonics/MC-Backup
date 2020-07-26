#/bin/bash
cd #absolute path to minecraft directory
session= #session name of the tmux server
levelName= #world name of the minecraft file
numberOfBackups=9 #number of backups this server will store

tmux send-keys -t ${session} "say Backing up server..." Enter
tmux send-keys -t ${session} "save-off" Enter
tmux send-keys -t ${session} "save-all" Enter
tar -cvzf backup/${levelName}-$(date "+%Y-%m-%d-%H-%M").tar.gz ${levelName}/*
tmux send-keys -t ${session} "save-on" Enter
tmux send-keys -t ${session} "say Server backup complete!" Enter

#cleanup
mkdir -p backup
cd backup/
ls -1tr | head -n -${numberOfBackups} | while IFS= read -r f; do
	rm -f "$f"
done
