#!/usr/bin/env sh

df_output=$(df -BG / | tail -1)
total=$(echo $df_output | awk '{print $2}')
used=$(echo $df_output | awk '{print $3}')
available=$(echo $df_output | awk '{print $4}')
percentage=$(echo $df_output | awk '{print $5}')

total=${total::-1}
used=${used::-1}
available=${available::-1}

# echo "disk: $available, $used/$total ($percentage)"
echo "disk: ${available}GB, $used/${total}GB ($percentage)"
