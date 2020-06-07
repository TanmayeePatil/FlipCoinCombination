#!/bin/bash

echo "WELCOME TO FLIP COIN COMBINATION PROBLEM"

myRan=$(( ( RANDOM % 2 ) + 1 ))

if [ $myRan -eq 1 ];then
   echo "HEADS"
else
   echo "TAILS"
fi
