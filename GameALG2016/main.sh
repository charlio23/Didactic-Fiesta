#!/bin/bash

# Param1: min
p1start=50
p1step=25
p1end=200
params1=$(seq $p1start $p1step $p1end)

# Param2: dist_bruixes
p2start=0.0
p2step=0.1
p2end=1.0
params2=$(seq $p2start $p2step $p2end)

printf "m_vida\tdwitch\tResultats\n"
for param1 in $params1
do
	for param2 in $params2
	do
		echo $param1 > params/param1.txt
		param1=$(sed 's/,/./g' params/param1.txt)
		echo $param1 > params/param1.txt
		
		echo $param2 > params/param2.txt
		param2=$(sed 's/,/./g' params/param2.txt)
		echo $param2 > params/param2.txt
		# (per a cadascun dels paràmetres escollits)

		# Executa qualsevol comanda com al terminal
		# ./Game ...
		text=$( python executa_Linux.py Rob Dummy Dummy Dummy 10 | grep Rob )
		printf "$param1\t$param2\t $text\n"
	done
done



















# Opcionals
	# Guarda tot el contingut de file1.txt
	# rm file3.txt
	# echo $i >> file3.txt
	# Al codi en C++:
	# ifstream myfile;
	# myfile.open("data.txt");
	# myfile >> a;
	# myfile.close();
