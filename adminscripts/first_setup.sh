#!bin/bash
#let me inside of [gitrepo]/adminscripts plz :)
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
GLOB_DIR=$SCRIPT_DIR/..

if [ $(id -u) -ne 0 ]
   then echo "Run me as root! trust me :]"
   exit
fi

apt update;
apt upgrade;
apt install -y docker docker-compose python3 curl nmap emacs-nox unzip zip htop postfix;
curl https://rclone.org/install.sh | sudo bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update;
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
mkdir ~/Downloads;
git remote add myserv git.hugowillaume.com/Hurlu/ServerContainers;
# setup my rclone remote named "Gdrive" with advanced option root folder 1Vtw9u>
rclone config
# reinstall my backup data
cd ~/Downloads;
rclone copy Gdrive: .;
cp standardfile.db $GLOB_DIR/notes/.;
cp mealie.zip $GLOB_DIR/recipes/.;
cp gitea_backup.zip $GLOB_DIR/gitea/.;
rm ~/Downloads/*
cd $GLOB_DIR/recipes
unzip -o mealie.zip
cd $GLOB_DIR/gitea


# restore gitea: https://docs.gitea.io/en-us/backup-and-restore/#restore-command-restore

# update crontab to call backup_to_gdrive every 8 hours: (crontab -e, no need for sudo)
#* */8 * * * /home/hurlu/ServerContainers/adminscripts/backup_to_gdrive.sh
# manually go to my sample files in each container folder to write actual secrets
# run server containers
# profit :]

