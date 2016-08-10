#!/bin/bash

if [[ -z "$1" ]]; then
find . -name "*.txt" -print0 | xargs -0 "$0"
fi

while [[ "$1" ]]; do
    fn="$1"
    shift
    fold -w 80 -s "$fn" | sed 's/[[:space:]]$//' > "$fn.tmp"
    mv -v "$fn.tmp" "$fn"
done
