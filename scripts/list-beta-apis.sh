#!/bin/bash
# List all API documentation files in beta branch
# Usage: ./scripts/list-beta-apis.sh [pattern]

PATTERN=${1:-*.lua}

echo "=== Beta API Documentation Files ==="
echo ""
find beta-api/Interface/AddOns/Blizzard_APIDocumentationGenerated -name "$PATTERN" -type f | sort
