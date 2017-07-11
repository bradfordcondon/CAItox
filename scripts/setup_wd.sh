#!/bin/bash
cd fasta
##Set up working directory
mkdir Aq
mkdir Ar
mkdir Ca
mkdir Cc
mkdir Ch
mkdir Dz
mkdir Li
mkdir Lm
mkdir Pb
mkdir Pr

mkdir Aq/tox
mkdir Ar/tox
mkdir Ca/tox
mkdir Cc/tox
mkdir Ch/tox
mkdir Dz/tox
mkdir Li/tox
mkdir Lm/tox
mkdir Pb/tox
mkdir Pr/tox

mkdir Aq/ctrl
mkdir Ar/ctrl
mkdir Ca/ctrl
mkdir Cc/ctrl
mkdir Ch/ctrl
mkdir Dz/ctrl
mkdir Li/ctrl
mkdir Lm/ctrl
mkdir Pb/ctrl
mkdir Pr/ctrl

cd tox

FILES=*.txt
for f in $FILES
do
	perl ../../scripts/split_fasta.pl < $f
	mv *.fasta ../${f:0:2}/tox/
done



cd ../conserved

FILES=*.txt
for f in $FILES
do
	perl ../../scripts/split_fasta.pl < $f
	mv *fasta ../${f:0:2}/ctrl/

done

cd ../
rm -rf tox
rm -rf conserved