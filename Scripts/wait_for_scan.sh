#!/bin/bash

SCAN_ID=$1

while true; do
  STATUS=$(curl -s \
    -H "X-ApiKeys: accessKey=${TENABLE_ACCESS_KEY};secretKey=${TENABLE_SECRET_KEY}" \
    "https://cloud.tenable.com/scans/${SCAN_ID}" | jq -r '.info.status')

  echo "Scan status: $STATUS"

  if [[ "$STATUS" == "completed" ]]; then
    break
  fi

  sleep 60
done
