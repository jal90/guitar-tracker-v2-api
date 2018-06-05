#!/bin/bash

curl "http://localhost:4741/setups/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "setup": {
      "string_brand": "'"${TEXT}"'",
      "guitar_id": "'"${GUIT_ID}"'",
      "setup_notes": "'"${TEXT}"'"
    }
  }'

echo
