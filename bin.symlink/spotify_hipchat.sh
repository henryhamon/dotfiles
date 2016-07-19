ROOM_ID="1848912" # music room
AUTH_TOKEN="l5bBwNyVZVWdDUrgTFUnHRElHPR8frypU8vt5xdS" # https://chute.hipchat.com/account/api

function getURL {
  url=`osascript -e 'tell application "Spotify" to spotify url of current track'`
  remove='spotify:track:'
  url=${url#$remove}
  url="http://open.spotify.com/track/$url"

  echo $url
}

function getThumbnail {
  url=$1
  thumbnail=`curl -L $url | pup "img.cover" | sed -E s/.*src=\"/http:/ | sed s/\"\>//`

  echo $thumbnail
}

function songCard {
  artist="$1"
  album="$2"
  track="$3"
  thumbnail="$4"
  title="Playing $artist - $track"
  sid=`echo $title | sed "s/\ -\ /\ /" | sed "s/\ /-/g"`
  description="{ \"format\": \"html\", \"value\": \"Album $album\" }"
  thumbnail="{ \"url\": \"$thumbnail\" }"

  echo "{\"style\": \"media\", \"url\": \"$url\", \"title\": \"$title\", \"id\": \"$sid\", \"description\": $description, \"thumbnail\": $thumbnail }"
}

function doRequest {
  json="$1"
  auth_token="$2"
  url="https://api.hipchat.com/v2/room/$ROOM_ID/notification?auth_token=$auth_token"
  curl -silent -H "Content-Type: application/json" -X POST -d "$json" $url
}

state=`osascript -e 'tell application "Spotify" to player state as string'`
if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`
    album=`osascript -e 'tell application "Spotify" to album of current track as string'`
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`
    message="Currently playing: Artist: $artist - Album: $album - Track: $track"

    echo $message

    url=$(getURL)
    thumbnail=`getThumbnail "$url"`

    card=`songCard "$artist" "$album" "$track" "$thumbnail"`
    json="{ \"card\": $card, \"color\": \"gray\", \"message_format\": \"html\", \"message\": \"$message\" }"

    doRequest "$json" "$AUTH_TOKEN"
  else
    echo "Not Playing"
fi
