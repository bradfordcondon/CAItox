#!/bin/bash

#Array of tox genes we'll seperate from the controls

declare -a toxgenes=("DEC1" "LAM1" "OXI1" "PKS1" "PKS2" "REDa" "Redb" "TOX10" "TOX9")

declare -a taxa=("Aq" "Ar" "Ca" "Cc" "Ch" "Dzm" "Li" "Lm" "Pbr" "Pra")


##Set up working directory
mkdir Aq
mkdir Ar
mkdir Ca
mkdir Cc
mkdir Ch
mkdir Dzm
mkdir Li
mkdir Lm
mkdir Pbr
mkdir Pra

mkdir Aq/tox
mkdir Ar/tox
mkdir Ca/tox
mkdir Cc/tox
mkdir Ch/tox
mkdir Dzm/tox
mkdir Li/tox
mkdir Lm/tox
mkdir Pbr/tox
mkdir Pra/tox

mkdir Aq/ctrl
mkdir Ar/ctrl
mkdir Ca/ctrl
mkdir Cc/ctrl
mkdir Ch/ctrl
mkdir Dzm/ctrl
mkdir Li/ctrl
mkdir Lm/ctrl
mkdir Pbr/ctrl
mkdir Pra/ctrl


FILES=*.txt
for f in $FILES
do
	perl ../scripts/split_fasta.pl < $f

done

for dir in */

	cd dir

	for f in *.fasta
	do
	
	if [[ " ${toxgenes[@]} " =~ " ${f} " ]]; then

		mv $f tox/
	else 
		mv $f ctrl/

	fi



done






## move sequences to appropriate folder

# I didn't automate this!