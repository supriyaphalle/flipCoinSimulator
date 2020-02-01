#!/bin/bash 

declare -A flips

#constant
Head=0;
Tail=1;


function  flipcoin(){
for ((i=0;i<$1;i++))
do
    flps=""
    for ((j=0;j<$2;j++))
       do
         if (( $((RANDOM%2)) == $Head ))
         then
            flps+=H
         else
            flps+=T
         fi
      done
      flips[$flps]=$((${flips[$flps]}+1))
   done
   percentageCalculation 
}



function percentageCalculation(){
   for i in ${!flips[@]}
   do
      echo "$i= ${flips[$i]}"
      echo " percentage of occuring $1= `echo "scale=2; ${flips[$i]}*100/$loop" | bc`%"
      echo "$i"
   done
}


while ((1))

do
   for i in ${!flips[@]}
  do
      unset flips[$i]
   done

   echo "                          Welcome To the Flipcoin Simulator"
   read -p "Enter 1/0 to start stimulator" x
   if (( $x == 1 ))
   then
      read -p "Select the option  for flip:  1)Singlet  2)Doublet   3)Triplet" option
      read -p "How many times you want to Flip Coin" loop
      flipcoin $loop $option
      echo " all values " ${flips[@]}
      echo "${!flips[@]}"
   else
      break
   fi
done


