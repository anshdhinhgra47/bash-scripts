#!/bin/bash
# This is a sample Bash script that guesses a random number

a=$RANDOM
secret=${a:0:1}

function game {
	read -p "Guess a random number: " guess
	while [[ $guess != $secret ]]; do
	read -p "Try again!: " guess
	done
echo "Good job! $secret is the number"
}

function greet {
	echo "Well looks like you don't wanna play!"
	echo "Here's a random number: $a"
}

if [[ $1 =~ game|Game|GAME ]]
then
	game
else
	greet
fi
