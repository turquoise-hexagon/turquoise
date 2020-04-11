#!/bin/bash

. Pkgfile

# create dir
dir=patches

rm -rf   "$dir"
mkdir -p "$dir"

# download patches
patch_level=${version##*.}
long_version=${version%.*}
short_version=${long_version//.}

for ((i = 1; i <= patch_level; ++i)) {
    printf -v tmp '%03d' "$i"

    curl -s "https://ftp.gnu.org/gnu/bash/bash-$long_version-patches/bash$short_version-$tmp" \
        > "$dir/$tmp.patch"
}

# create archive
tar czvf "$dir.tar.gz" "$dir"

rm -rf "$dir"
