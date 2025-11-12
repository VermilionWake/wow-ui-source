#!/bin/bash
# View a specific API file from beta branch
# Usage: ./scripts/view-beta-api.sh [filename]

if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    echo "Example: $0 AccountInfoDocumentation.lua"
    exit 1
fi

API_FILE="beta-api/Interface/AddOns/Blizzard_APIDocumentationGenerated/$1"

if [ -f "$API_FILE" ]; then
    less "$API_FILE"
else
    echo "File not found: $API_FILE"
    echo ""
    echo "Available API files:"
    ./scripts/list-beta-apis.sh
    exit 1
fi
