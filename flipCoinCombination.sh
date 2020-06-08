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

################# DOUBLET COIN FLIP #####################
countHH=0
countHT=0
countTH=0
countTT=0
filpTimes=$(( $filpTimes*2 ))

while [ $i -ne $filpTimes ]
do
myRan=$(( (RANDOM % 4) + 1 ))

 if [ $myRan -eq 1 ];then
   FilpCoinDict[$i]="HH"
   ((countHH++))
 elif [ $myRan -eq 2 ];then
   FilpCoinDict[$i]="HT"
   ((countHT++))
 elif [ $myRan -eq 3 ];then
   FilpCoinDict[$i]="TH"
   ((countTH++))
 else
   FilpCoinDict[$i]="TT"
   ((countTT++))
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
echo "DOUBLET RESULT: "
echo "-------------------------------------------------"
echo "Count of HH: $countHH"
echo "Count of HT: $countHT"
echo "Count of TH: $countTH"
echo "Count of TT: $countTT"

singleHHPer=`echo $countHH $filpTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
singleHTPer=`echo $countHT $filpTimes | awk -F" " '{ x=$1; y=$2; res2=(x/y*100); print res2 }'`
singleTHPer=`echo $countTH $filpTimes | awk -F" " '{ p=$1; q=$2; res3=(p/q*100); print res3 }'`
singleTTPer=`echo $countTT $filpTimes | awk -F" " '{ o=$1; m=$2; res4=(o/m*100); print res4 }'`

echo ""
echo "Percentage HH: $singleHHPer"
echo "Percentage HT: $singleHTPer"
echo "Percentage TH: $singleTHPer"
echo "Percentage TT: $singleTTPer"
echo "-------------------------------------------------"
