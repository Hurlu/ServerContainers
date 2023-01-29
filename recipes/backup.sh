SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

cd $SCRIPT_DIR;
zip -r -9 mealie.zip mealie;
rclone copy mealie.zip Gdrive:/;
rm mealie.zip


