#!/bin/bash

if [[ ! -f "package-lock.json" ]]; then
  exit 0
fi

frameworks=("hono" "nest" "next" "nuxt" "expo")
packages=("hono" "@nestjs/core" "next" "nuxt" "expo")
icons=("" "" "" "󱄆" "")

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

exit 0
