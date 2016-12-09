#!/bin/bash

# Parameter testing
# Using Python code from deanamic
# deanamic.github.io/DOMINATOR

# Two-parameter example
# Additional parameters may be tested by using additional fors

# First run: `mkdir params`

# To be included in C++ code:
# #include <fstream>
# (...)
# ifstream myfile;
# myfile.open("params/parami.txt");
# myfile >> parameter_i; // Replace with parameter 1 variable in the code
# myfile.close();

# Usage: ./main.sh <player1> <player2> <player3> <player4> <matches> <rplayer>
# matches: number of matches to be performed by each parameter combination
# rplayer: player name to get results about

player1=$1
player2=$2
player3=$3
player4=$4
matches=$5
rplayer=$6

# List of parameters
	# Parameter 1: int example
	p1start=50
	p1step=25
	p1end=200
	params1=$(seq $p1start $p1step $p1end)

	# Parameter 2: double example
	p2start=0.0
	p2step=0.1
	p2end=1.0
	params2=$(seq $p2start $p2step $p2end)

# Printing table of results
printf "P1 \tP2 \tResults\n"

for param1 in $params1
do
	for param2 in $params2
	do
		# Write parameter 1 value to be read by player
		# Replace commas with dots if necessary (Spanish versions)
		param1=$(echo $param1 | sed 's/,/./g')
		echo $param1 > params/param1.txt
		
		# Write parameter 2 value to be read by player
		param2=$(echo $param2 | sed 's/,/./g')
		echo $param2 > params/param2.txt
		
		# Executes Python script to get results
		text=$(python executa_Linux.py $player1 $player2 $player3 $player4 $matches | grep $rplayer)
		printf "$param1\t$param2\t$text\n"
	done
done
