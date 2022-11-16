#!/usr/bin/env bash

if (($# != 1)); then
    echo "usage : ${0##*/} <Pkgfile>" >&2

    exit 1
fi

declare -A mem

while IFS= read -r package; do
    ((mem[$package] = 0))
done <<< $(prt-get list)

while IFS= read -r line; do
    if [[ $line =~ '# '(Depends on|Optional)' '+': '(.+) ]]; then
        IFS=' ' read -r -a packages <<< ${BASH_REMATCH[2]}

        for package in "${packages[@]}"; do
            if [[ ! ${mem[$package]} ]]; then
                echo "$package"
            fi
        done
    fi
done < "$1"
