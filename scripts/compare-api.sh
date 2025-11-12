#!/bin/bash
# Compare API documentation between different branches
# Usage: ./scripts/compare-api.sh [live|beta|ptr] [live|beta|ptr] [api_name]

set -e

BRANCH1=${1:-live}
BRANCH2=${2:-beta}
API_NAME=${3:-}

API_PATH="Interface/AddOns/Blizzard_APIDocumentationGenerated"

if [ -z "$API_NAME" ]; then
    echo "=== Comparing all API files between $BRANCH1 and $BRANCH2 ==="
    echo ""
    diff -qr "${BRANCH1}-api/${API_PATH}" "${BRANCH2}-api/${API_PATH}" | grep -v "Only in" || true
    echo ""
    echo "Files only in $BRANCH1:"
    diff -qr "${BRANCH1}-api/${API_PATH}" "${BRANCH2}-api/${API_PATH}" | grep "Only in ${BRANCH1}-api" || echo "  None"
    echo ""
    echo "Files only in $BRANCH2:"
    diff -qr "${BRANCH1}-api/${API_PATH}" "${BRANCH2}-api/${API_PATH}" | grep "Only in ${BRANCH2}-api" || echo "  None"
else
    echo "=== Comparing $API_NAME between $BRANCH1 and $BRANCH2 ==="
    echo ""
    diff -u "${BRANCH1}-api/${API_PATH}/${API_NAME}" "${BRANCH2}-api/${API_PATH}/${API_NAME}" || true
fi
