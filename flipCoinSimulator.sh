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
      echo " percentage of occuring $1= `echo "scale=2; ${flips[$i]}*100/$loop" | bc`%"
   done
}



function sortingData(){
  for i in ${!flips[@]}
   do
   #  j=$i
      for j in ${!flips[@]}
      do
         k=$j
         if (( ${flips[$i]} > ${flips[$j]} ))
         then
            temp=${flips[$i]}
            flips[$i]=${flips[$j]}
            flips[$j]=$temp  
      #  echo ${flips[$k]}
         fi
      done
  done
}

function winingcombination(){
   for i in ${!flips[@]}
   do
      echo " wining combination is $i =  ${flips[$i]}"
      break
   done
}
#########################################    Main Programm ###################

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
		sortingData
     echo "${flips[@]}"
     echo "${!flips[@]}"
     winingcombination
   else
      break
   fi
done


