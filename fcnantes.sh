#!/bin/sh

SUFFIX="<"
MONITOR_FROM=11628 #latest : http://fcnantes.com/articles/article2809.php?num=11627
HOW_MANY=20
SCAN_UNTIL=$((MONITOR_FROM+HOW_MANY))
while true
do
  for NUM in $(seq $MONITOR_FROM 1 $SCAN_UNTIL); do
   TITLE=`curl -s http://fcnantes.com/articles/article2809.php\?num\=$NUM | grep "</title>"`
   TITLE=${TITLE%<*}
   echo "$NUM\t$TITLE"
   if [ ! -z "$TITLE" ]
    then
      echo $TITLE |  tr -d '[\200-\377]' | say -v Thomas 
    fi
  done
  sleep 30
done
