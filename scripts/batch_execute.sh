#!/bin/bash

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

## move sequences to appropriate folder
for dir in  */
cut="${dir}_CUT_Apr2017.txt"
do
	cd dir

	for ctrlseq in ctrl/*

	do
	 perl ../scripts/CAIcal_ECAI_v1.4.pl -f ctrl/$ctrlseq -h codons/$cut -p 95 -n 500 -l 1000 -o1 cai_aq_cc.txt -o2 random_aq_cc.txt -o3 expected_aq_cc.txt
	done

for toxseq in tox/*

	do
	 perl ../scripts/CAIcal_ECAI_v1.4.pl -f tox/$toxseq -h codons/$cut -p 95 -n 500 -l 1000 -o1 cai_aq_cc.txt -o2 random_aq_cc.txt -o3 expected_aq_cc.txt
	done

done


#perl ../scripts/CAIcal_ECAI_v1.4.pl -f fasta/cct3.fas -h codons/chcut2.txt -p 95 -n 500 -l 548
#perl scripts/CAIcal_ECAI_v1.4.pl -f fasta/Aq/ctrl/Aqcct3.fasta -h codons/Aq_CUT_Apr2017.txt -p 95 -n 500 -l 548 -o1 cai_aq_cc.txt -o2 random_aq_cc.txt -o3 expected_aq_cc.txt
