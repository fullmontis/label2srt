#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: $0 LABEL_FILE > SRT_FILE"
  exit
fi

function getTime {
  date -u -d @${1} +"%T,%3N"
}

i=1

while read start end text 
do
  printf "\n%d\n%s --> %s\n%s\n" $i "$(getTime $start)" "$(getTime $end)" "$text"
  i=$(($i+1))
done < "$1"
