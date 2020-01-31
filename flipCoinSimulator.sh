#constant
Head=0;
Tail=1;
loop=10;
Singlet[Head]=0
Singlet[Tail]=0

for ((i=0;i<$loop;i++))
do
	if (( $((RANDOM%2)) == $Head ))
	then
	#	echo "Head"
		Singlet[Head]=$((${Singlet[Head]}+1))
	else
	#	echo "Tail"
			Singlet[Tail]=$((${Singlet[Tail]}+1))
	fi

done

echo " all calues " ${Singlet[@]}
echo ${!Singlet[@]}
echo "Percentage of Singlet Combination"
echo " percentage of Occuring Head = $((${Singlet[Head]} * 100/$loop))"
echo " percentage of Occuring Tail = $((${Singlet[Tail]} * 100/$loop))"
