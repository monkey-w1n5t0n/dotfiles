#!/usr/bin/env sh

# Extract temperatures for all cores and sort in descending order
temps=$(sensors 'coretemp-isa-0000' | grep 'Core' | awk '{print $3}' | sed 's/[+°C]//g' | sort -rn)

# Get the highest temperature
highest_temp=$(echo "$temps" | head -n1)
highest_temp=${highest_temp:-1:}
# Format the highest temperature with a degree circle and a "C" at the end
echo -e "$highest_temp\xC2\xB0C"
