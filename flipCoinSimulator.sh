#!/bin/bash 

declare -A flipsDictionary

#constant
HEAD=0;
TAIL=1;

function  flipCoin() {
	local loop=$1
	local coin=$2
	for ((i=0;i<$loop;i++))
	do
		flipCombination=""
		for ((j=0;j<$coin;j++))
		do
			if (( $((RANDOM%2)) == $HEAD ))
			then
				flipCombination+=H
			else
				flipCombination+=T
			fi
		done
		flipsDictionary[$flipCombination]=$((${flipsDictionary[$flipCombination]}+1))
	done
	percentageCalculation 
}

function percentageCalculation() {
	for i in ${!flipsDictionary[@]}
	do
		echo " percentage of occuring $1= `echo "scale=2; ${flipsDictionary[$i]}*100/$loop" | bc`%"
	done
}

function sortingData() {
	for i in ${!flipsDictionary[@]}
	do
		for j in ${!flipsDictionary[@]}
		do
			k=$j
			if (( ${flipsDictionary[$i]} > ${flipsDictionary[$j]} ))
			then
				temp=${flipsDictionary[$i]}
				flipsDictionary[$i]=${flipsDictionary[$j]}
				flipsDictionary[$j]=$temp  
			fi
		done
	done
}

function winingCombination() {
	for i in ${!flipsDictionary[@]}
	do
		echo " wining combination is $i =  ${flipsDictionary[$i]}"
		break
	done
}

function makeDictionaryEmpty() {
	for i in ${!flipsDictionary[@]}
	do
		unset flipsDictionary[$i]
	done
}

function inputs() {
	echo "                          Welcome To the flipCoin Simulator"
   read -p "Select the option  for flip:  1)Singlet  2)Doublet   3)Triplet  " option
   read -p "How many times you want to Flip Coin  " loop
}


function displayData() {
	echo "total Combinations:  ${!flipsDictionary[@]}"

}

#########################################    Main Programm ###################

x=1

while (( $x==1 ))
do
	makeDictionaryEmpty
	inputs
	flipCoin $loop $option
	sortingData
	echo "value of echo combination: ${flipsDictionary[@]}"
	echo "value of echo combination: ${!flipsDictionary[@]}"


	#diaplayData
	winingCombination
	read -p "Enter 1 to continue   " x
done


