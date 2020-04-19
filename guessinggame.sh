#!/usr/bin/env bash
# File: guessinggame.sh

numfiles=$(ls -pA | grep -v / | wc -l)
answer="wrong"

function guesscheck {
	if [[ $guess -eq $numfiles ]]
	then
		echo "Correct, well done"
		let answer="correct"
	else
	if [[ $guess -gt $numfiles ]]
	then
		echo "Too high, guess again:"
	elif [[ $guess -lt $numfiles ]]
	then
		echo "Too low, guess again:"
	fi
	fi
}

echo "The current directory is $PWD. How many files (including hidden ones!) are in here? Take a guess and enter it below:"
while [[ $answer = "wrong" ]]
do
	read guess
	if [[ $guess =~ [a-zA-Z] ]] || [[ $guess -lt 0 ]]
	then
		echo "Invalid input. Maybe guess an integer greater than or equal to zero. Guess again:"
	elif [[ $guess -gt -1 ]]
	then
		guesscheck
	else
		echo "Yikes! Really invalid input. Maybe guess an integer greater than or equal to zero. Guess again:"
	fi
done
echo "Thanks for guessing!"
