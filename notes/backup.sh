SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

cd $SCRIPT_DIR;
rclone copy standardfile.db Gdrive:backups/;


