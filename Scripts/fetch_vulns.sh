#!/bin/bash

SCAN_ID=$1

curl -s \
  -H "X-ApiKeys: accessKey=${TENABLE_ACCESS_KEY};secretKey=${TENABLE_SECRET_KEY}" \
  "https://cloud.tenable.com/scans/${SCAN_ID}" \
| jq '.vulnerabilities[] | select(.severity==4)' | wc -l
