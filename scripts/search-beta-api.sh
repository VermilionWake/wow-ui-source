#!/bin/bash
# Search for a term in beta API documentation
# Usage: ./scripts/search-beta-api.sh <search_term>

if [ -z "$1" ]; then
    echo "Usage: $0 <search_term>"
    echo "Example: $0 'C_AccountInfo'"
    exit 1
fi

echo "=== Searching beta API for: $1 ==="
echo ""
grep -r "$1" beta-api/Interface/AddOns/Blizzard_APIDocumentationGenerated/ --color=always | head -50
