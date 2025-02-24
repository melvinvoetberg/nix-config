#!/bin/bash

frameworks=("hono" "nest" "next" "nuxt" "expo")
packages=("hono" "@nestjs/core" "next" "nuxt" "expo")
icons=("" "" "" "󱄆" "")

# Check for bun.lock first
if [[ -f "bun.lock" ]]; then
  # Get the list of installed packages from bun
  dependencies=$(bun pm ls)

  for i in "${!frameworks[@]}"; do
    framework="${frameworks[$i]}"
    package="${packages[$i]}"
    icon="${icons[$i]}"
    
    # Extract version using grep and sed
    version=$(echo "$dependencies" | grep -E "^[├└]── $package@" | sed -E 's/.*@([0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?).*/\1/')
    
    if [[ -n $version ]]; then
      echo "$icon $version"
      exit 0
    fi
  done
# Then check for package-lock.json
elif [[ -f "package-lock.json" ]]; then
  dependencies=$(jq -c '.packages // {}' "package-lock.json")

  for i in "${!frameworks[@]}"; do
    framework="${frameworks[$i]}"
    package="node_modules/${packages[$i]}"
    icon="${icons[$i]}"
    version=$(echo "$dependencies" | jq -r ".\"$package\".version // empty")

    if [[ -n $version ]]; then
      echo "$icon $version"
      exit 0
    fi
  done
fi

exit 0
