# Easy Beta API Access

This repository now includes worktrees and helper scripts for easy access to beta, ptr, and live API documentation.

## Directory Structure

```
wow-ui-source/           # Main development branch
├── beta-api/            # Beta branch worktree (read-only for reference)
├── ptr-api/             # PTR branch worktree (read-only for reference)
├── live-api/            # Live branch worktree (read-only for reference)
└── scripts/             # Helper scripts
```

## Available Scripts

### 1. List Beta APIs
```bash
./scripts/list-beta-apis.sh [pattern]
```

Examples:
```bash
# List all API files
./scripts/list-beta-apis.sh

# List specific APIs
./scripts/list-beta-apis.sh "Account*"
```

### 2. View Beta API
```bash
./scripts/view-beta-api.sh <filename>
```

Example:
```bash
./scripts/view-beta-api.sh AccountInfoDocumentation.lua
```

### 3. Search Beta API
```bash
./scripts/search-beta-api.sh <search_term>
```

Examples:
```bash
./scripts/search-beta-api.sh "C_AccountInfo"
./scripts/search-beta-api.sh "GetBuildInfo"
```

### 4. Compare APIs Between Branches
```bash
./scripts/compare-api.sh [branch1] [branch2] [api_file]
```

Examples:
```bash
# Compare all APIs between live and beta
./scripts/compare-api.sh live beta

# Compare specific API file
./scripts/compare-api.sh live beta AccountInfoDocumentation.lua

# Compare ptr and beta
./scripts/compare-api.sh ptr beta
```

## Direct Access

You can also directly browse the API files:

**Beta API:**
```bash
cd beta-api/Interface/AddOns/Blizzard_APIDocumentationGenerated/
ls -la
```

**PTR API:**
```bash
cd ptr-api/Interface/AddOns/Blizzard_APIDocumentationGenerated/
ls -la
```

**Live API:**
```bash
cd live-api/Interface/AddOns/Blizzard_APIDocumentationGenerated/
ls -la
```

## Updating the Worktrees

To update the beta/ptr/live worktrees with latest changes:

```bash
# Update beta
cd beta-api && git fetch origin && git reset --hard origin/beta && cd ..

# Update ptr
cd ptr-api && git fetch origin && git reset --hard origin/ptr && cd ..

# Update live
cd live-api && git fetch origin && git reset --hard origin/live && cd ..
```

Or use this one-liner:
```bash
cd beta-api && git fetch origin && git reset --hard origin/beta && cd ../ptr-api && git fetch origin && git reset --hard origin/ptr && cd ../live-api && git fetch origin && git reset --hard origin/live && cd ..
```

## What's New in Beta?

To quickly see what APIs have changed between live and beta:

```bash
./scripts/compare-api.sh live beta | less
```

## Git Worktree Information

The worktrees are separate working directories that checkout different branches:
- They don't affect your main working directory
- They're read-only references (don't make changes in them)
- They share the same `.git` directory, so they're space-efficient
- You can view them simultaneously without switching branches

To see all worktrees:
```bash
git worktree list
```

To remove a worktree (if needed):
```bash
git worktree remove beta-api
```

## Notes

- The worktrees are set up in detached HEAD state for read-only reference
- Always do your development work in the main `wow-ui-source` directory
- The API documentation is located in `Interface/AddOns/Blizzard_APIDocumentationGenerated/`
- Each API file contains Functions, Events, Tables, and Constants for that system
