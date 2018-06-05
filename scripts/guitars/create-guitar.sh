#!/bin/bash

curl "http://localhost:4741/guitars" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "guitar": {
      "make": "'"${MAKE}"'"
    }
  }'

echo
