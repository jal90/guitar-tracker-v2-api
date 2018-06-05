#!/bin/bash

curl "http://localhost:4741/setups" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "setup": {
      "string_gauge": "'"${TEXT}"'",
      "guitar_id": "'"${ID}"'"
    }
  }'

echo
