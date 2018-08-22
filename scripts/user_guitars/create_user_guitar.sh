#!/bin/bash

curl "http://localhost:4741/user_guitars" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "user_guitar": {
      "price": "'"${PRICE}"'",
      "year": "'"${YEAR}"'"
    },
    "guitar": {
      "make": "'"${MAKE}"'",
      "model": "'"${MODEL}"'"
    }
  }'

echo
