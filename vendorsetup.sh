#!/bin/bash

REPO="akifakif32/infinity-x-patches"
BRANCH="main"
RET=0

fetch_patch() {
    gh api "repos/${REPO}/contents/$1?ref=${BRANCH}" \
        --jq '.content' | base64 -d
}

echo "- Applying compatibility and security patches"

echo "  -> Applying first patch"
( cd system/fs/fs_mgr && fetch_patch "first.patch" | git am >/dev/null 2>&1 ) || {
    RET=1
    ( cd system/fs/fs_mgr && git am --abort >/dev/null 2>&1 )
}

echo "  -> Applying second patch"
( cd system/core && fetch_patch "second.patch" | git am >/dev/null 2>&1 ) || {
    RET=1
    ( cd system/core && git am --abort >/dev/null 2>&1 )
}

echo "  -> Applying third patch"
( cd system/core && fetch_patch "third.patch" | git am >/dev/null 2>&1 ) || {
    RET=1
    ( cd system/core && git am --abort >/dev/null 2>&1 )
}

if [ $RET -ne 0 ]; then
  echo "ERROR: Patch is not applied! Maybe it's already patched, or you'll have to adapt it to this specific rom source?"
else
  echo "OK: All patched"
fi
