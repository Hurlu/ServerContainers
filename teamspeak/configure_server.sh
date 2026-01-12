#required packages: httpie, jq

DOCKER_IP=$(docker inspect --format '{{ range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' teamspeak)
BASE_COMMAND="http $DOCKER_IP:10080/1"
API_KEY="?api-key=$(cat api_key.secret)"


#Trying to give Guests permission to move anyone among channels, not working yet so doing it manually in ts3-client
#GUEST_ID=$($BASE_COMMAND/servergrouplist$API_KEY | jq -r '.body[4].sgid')
#echo "{\"sgid\": \"$GUEST_ID\", \"permsid\":\"i_client_needed_move_power\", \"permvalue\":0, \"permnegated\":0, \"permskip\":0 }" | $BASE_COMMAND/servergroupaddperm$API_KEY
#echo

#exit 0


AFK_ID=$(echo '{"channel_name": "AFK", "channel_flag_permanent":1, "channel_needed_talk_power":999}' | $BASE_COMMAND/channelcreate$API_KEY | jq -r '.body[0].cid')
echo "{\"channel_name\": \"Pokez-moi\", \"channel_flag_permanent\":1, \"channel_needed_talk_power\":999, \"cpid\":$AFK_ID}" | $BASE_COMMAND/channelcreate$API_KEY
echo
echo '{"channel_name": "Café Sonneveld", "channel_flag_permanent":1}' | $BASE_COMMAND/channelcreate$API_KEY
echo
echo '{"channel_name": "Le Coco", "channel_flag_permanent":1}' | $BASE_COMMAND/channelcreate$API_KEY
echo
echo '{"channel_name": "STREAM ON", "channel_flag_permanent":1}' | $BASE_COMMAND/channelcreate$API_KEY
echo
echo '{"channel_name": "FEBO", "channel_flag_permanent":1}' | $BASE_COMMAND/channelcreate$API_KEY
echo
