#!/bin/bash

curl "http://localhost:4741/user_guitars/avg_price" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
