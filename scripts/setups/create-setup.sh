#!/bin/bash

curl "http://localhost:4741/setups" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "setup": {
      "setup_notes": "'"${TEXT}"'",
      "guitar_id": "'"${ID}"'"
    }
  }'

echo
