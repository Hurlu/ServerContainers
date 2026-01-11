SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
GLOB_DIR=$SCRIPT_DIR/..

# not included: terraria, perforce (too heavy, only for special occasions)
# not included: gotify (might be of use later, just not yet)
# not included: whoami (testing purposes)
SERVICES=( traefik ftp gitea joplin mopidy musicdownload recipes syncthing teamspeak wizz )

for service in "${SERVICES[@]}"
do
	cd $GLOB_DIR/$service; docker compose down; docker compose up -d --build;
done
