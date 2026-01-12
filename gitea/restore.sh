# open gitea_db docker
# use gitea_db secrets to put the content of the gitea_db.sql file into psql, like joplin's restore.sh
#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

if [[ $1 == "" ]]
then
  echo "./restore.sh [gitea backup zip file name]"
  exit 1
else
  read -r -p "Assuming $1 is the gitea zip backup file: is it correct ? (y/n) " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
  FILE_NAME=$1
  else
    exit 1
  fi
fi

read -r -p "Have you started the docker container ? (y/n) " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  read -r -p "Have you started the install wizard ? (you shouldn't have) (y/n) " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
  echo "Too soon for the web install wizard, start over the backup process."
  exit 1
  fi
else
  echo "Then do it, and launch this script again afterwards !"
  exit 1
fi


unzip -d $SCRIPT_DIR/unzipped $1

#restore gitea's postgres DB
sudo mv $SCRIPT_DIR/unzipped/gitea-db.sql $SCRIPT_DIR/postgres/.
source $SCRIPT_DIR/secrets/gitea_db.secret
docker exec \
-e POSTGRES_USER \
-e POSTGRES_DB \
gitea_db \
bash -c "psql -U $POSTGRES_USER $POSTGRES_DB < /var/lib/postgresql/data/gitea-db.sql"

read -r -p "Have you started the docker container and did you got through the web install wizard ? (y/n) " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo "Proceeding with backup restoration..."
else
  read -r -p "Then just go do it ! Then where you're done, press Enter." response
fi

source $SCRIPT_DIR/secrets/gitea.secret

sudo mv -f $SCRIPT_DIR/unzipped gitea_data/.

#creating extra folder
docker exec gitea \
/bin/bash -c "mkdir -p /data/git/repositories"

#chown all to git
docker exec gitea \
/bin/bash -c "chown -R git:git /data"

#copy app.ini
docker exec gitea \
/bin/bash -c "cp /data/unzipped/app.ini /data/gitea/conf/."

#copy repos
docker exec gitea \
/bin/bash -c "cp -rf /data/unzipped/repos/* /data/git/repositories/."

#copy the rest
docker exec gitea \
/bin/bash -c "cp -rf /data/unzipped/data/* /data/gitea/."

#chown all to git again, to be safe
docker exec gitea \
/bin/bash -c "chown -R git:git /data"

#regen hooks
docker exec -u git gitea \
/bin/bash -c "/usr/local/bin/gitea -c '/data/gitea/conf/app.ini' admin regenerate hooks"

#one more tiiime
docker exec gitea \
/bin/bash -c "chown -R git:git /data"

sudo rm -rf gitea_data/unzipped

read -r -p "You now can restart your container, and it should be all good ! (bye/bye)"
