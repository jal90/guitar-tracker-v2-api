#!/bin/bash

curl "http://localhost:4741/guitars/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "guitar": {
      "make": "'"${MAKE}"'"
    }
  }'

echo
