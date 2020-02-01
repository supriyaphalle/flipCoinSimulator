#constant
#Head=0;
#Tail=1;
#loop=20;
#Singlet[Head]=0
#Singlet[Tail]=0
#

#while ((1))
#do
#	echo "Welcome To the Flipcoin Simulator"
#	read -p " Do you want to play 1/0" option
#	if(
#	for ((i=0;i<$loop;i++))
#	do
#		if (( $((RANDOM%2)) == $Head ))
#		then
		#	echo "Head"
#			Singlet[Head]=$((${Singlet[Head]}+1))
#		else
		#	echo "Tail"
#			Singlet[Tail]=$((${Singlet[Tail]}+1))
#		fi

#	done

#	echo " all calues " ${Singlet[@]}
#	echo ${!Singlet[@]}
#	echo "Percentage of Singlet Combination"
#	echo " percentage of Occuring Head = $((${Singlet[Head]} * 100/$loop))"
#	echo " percentage of Occuring Tail = $((${Singlet[Tail]} * 100/$loop))"




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


