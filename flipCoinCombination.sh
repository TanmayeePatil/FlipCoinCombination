#!/bin/bash

echo "WELCOME TO FLIP COIN COMBINATION PROBLEM"


declare -A FilpCoinDict

countHeads=0
countTails=0
i=0

read -p "How many time you want to flip coin: " filpTimes

while [ $i -ne $filpTimes ]
do
myRan=$(( ( RANDOM % 2 ) + 1 ))

 if [ $myRan -eq 1 ];then
   FilpCoinDict[$i]="HEAD"
   ((countHeads++))
 else
    FilpCoinDict[$i]="TAIL"
    ((countTails++))
  fi
   (( i++ ))
done

echo ""
echo "DICTONARY RECORDS:"
echo "-------------------------------------------------"
for key in "${!FilpCoinDict[@]}"; do
  printf '%s:%s\n' "$key" "${FilpCoinDict[$key]}"
done | sort -t : -k 2n
echo "-------------------------------------------------"

echo ""
echo "SINGLET RESULT"
echo "-------------------------------------------------"
echo "Count of head: $countHeads"
echo "Count of tail: $countTails"

singleHeadPer=`echo $countHeads $filpTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
singleTailPer=`echo $countTails $filpTimes | awk -F" " '{ x=$1; y=$2; res2=(x/y*100); print res2 }'`
echo ""
echo "Percentage Heads: $singleHeadPer"
echo "Percentage Tails: $singleTailPer"
echo "-------------------------------------------------"
