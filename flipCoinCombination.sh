#!/bin/bash

echo "WELCOME TO FLIP COIN COMBINATION PROBLEM"

declare -A FilpCoinDict

countHeads=0
countTails=0
i=0

read -p "How many time you want to flip coin: " filpTimes

orgFlipTimes=$filpTimes

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
filpTimes=$(( $filpTimes+$orgFlipTimes ))

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

doubletHHPer=`echo $countHH $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
doubletHTPer=`echo $countHT $orgFlipTimes | awk -F" " '{ x=$1; y=$2; res2=(x/y*100); print res2 }'`
doubletTHPer=`echo $countTH $orgFlipTimes | awk -F" " '{ p=$1; q=$2; res3=(p/q*100); print res3 }'`
doubletTTPer=`echo $countTT $orgFlipTimes | awk -F" " '{ o=$1; m=$2; res4=(o/m*100); print res4 }'`

echo ""
echo "Percentage HH: $doubletHHPer"
echo "Percentage HT: $doubletHTPer"
echo "Percentage TH: $doubletTHPer"
echo "Percentage TT: $doubletTTPer"
echo "-------------------------------------------------"

################# TRIPLET COIN FLIP #####################
countTTT=0
countHTT=0
countTHT=0
countTTH=0
countHTT=0
countHTH=0
countTHH=0
countHHH=0
filpTimes=$(( $filpTimes+$orgFlipTimes ))

while [ $i -ne $filpTimes ]
do
myRan=$(( (RANDOM % 8) + 1 ))
 if [ $myRan -eq 1 ];then
   FilpCoinDict[$i]="TTT"
   ((countTTT++))
 elif [ $myRan -eq 2 ];then
   FilpCoinDict[$i]="HTT"
   ((countHTT++))
 elif [ $myRan -eq 3 ];then
   FilpCoinDict[$i]="THT"
   ((countTHT++))
 elif [ $myRan -eq 4 ];then
   FilpCoinDict[$i]="TTH"
   ((countTTH++))
 elif [ $myRan -eq 5 ];then
   FilpCoinDict[$i]="HTT"
   ((countHTT++))
 elif [ $myRan -eq 6 ];then
   FilpCoinDict[$i]="HTH"
   ((countHTH++))
 elif [ $myRan -eq 7 ];then
   FilpCoinDict[$i]="THH"
   ((countTHH++))
 else
  FilpCoinDict[$i]="HHH"
   ((countHHH++))
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
echo "TRIPLET RESULT: "
echo "-------------------------------------------------"
echo "Count of TTT: $countTTT"
echo "Count of HTT: $countHTT"
echo "Count of THT: $countTHT"
echo "Count of TTH: $countTTH"
echo "Count of HTT: $countHTT"
echo "Count of HTH: $countHTH"
echo "Count of THH: $countTHH"
echo "Count of HHH: $countHHH"

tripletTTTPer=`echo $countTTT $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletHTTPer=`echo $countHTT $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletTHTPer=`echo $countTHT $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletTTHPer=`echo $countTTH $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletHTTPer=`echo $countHTT $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletHTHPer=`echo $countHTH $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletTHHPer=`echo $countTHH $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`
tripletHHHPer=`echo $countHHH $orgFlipTimes | awk -F" " '{ a=$1; b=$2; res1=(a/b*100); print res1 }'`

echo ""
echo "Percentage TTT: $tripletTTTPer"
echo "Percentage HTT: $tripletHTTPer"
echo "Percentage THT: $tripletTHTPer"
echo "Percentage TTH: $tripletTTHPer"
echo "Percentage HTT: $tripletHTTPer"
echo "Percentage HTH: $tripletHTHPer"
echo "Percentage THH: $tripletTHHPer"
echo "Percentage HHH: $tripletHHHPer"
echo "-------------------------------------------------"
