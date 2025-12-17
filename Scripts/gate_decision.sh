#!/bin/bash
set -e

echo "Critical Vulnerabilities: $CRITICAL"
echo "CIS Failed Controls: $CIS_FAILED"

if [[ "$CRITICAL" -gt "$CRITICAL_VULN_MAX" ]] || [[ "$CIS_FAILED" -gt "$CIS_FAILED_MAX" ]]; then
  echo "❌ SECURITY GATE FAILED"
  exit 1
fi

echo "✅ SECURITY GATE PASSED"
