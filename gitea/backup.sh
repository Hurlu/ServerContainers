SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

docker exec -u git -w "/data/git" $(docker ps -qf "name=^/gitea$") bash -c "/app/gitea/gitea dump -c /data/gitea/conf/app.ini";
cd $SCRIPT_DIR;
mv gitea_data/git/gitea-dump* gitea_backup.zip;
rclone copy gitea_backup.zip Gdrive:/;
rm -f gitea_backup.zip;
