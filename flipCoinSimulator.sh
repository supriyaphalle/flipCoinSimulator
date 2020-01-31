#! /bin/bash -x

echo "Welcome to the FlipCoin Simulator"

#constant
Head=0;
Tail=1;

if (( $((RANDOM%2)) == $Head ))
then
	echo "Head"
else
	echo "Tail"
fi
