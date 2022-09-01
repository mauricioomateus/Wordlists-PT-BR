#!/bin/bash

#$1 - Names list
#$2 - Delimeter
#$3 - Last names list
#$4 - Domain
#$5 - Output file

readarray -t a <$1   # read each line of file1
readarray -t b <$3   # read each line of file2
for itemA in "${a[@]}"; do
  for itemB in "${b[@]}"; do
    echo "Creating $itemA$2$itemB"$2@$4
    printf '%s%s\n' "$itemA"$2"$itemB"@$4 >> $5
  done
done

#Powered by Vyper | Hack the planet!
