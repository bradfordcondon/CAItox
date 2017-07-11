#!/bin/bash


for dir in  fasta/*/


do

	echo "Dir is $dir" #fasta/Aq/

	## Set up working directory first
	mkdir ${dir}out
	mkdir ${dir}out/tox
	mkdir ${dir}out/ctrl

	for ctrlseq in ${dir}ctrl/*

	do
	 perl scripts/CAIcal_ECAI_v1.4.pl -f $ctrlseq -h codons/${cut}_CUT_Apr2017.txt -p 95 -n 500 -l 1000 -o1 ${dir}_out/ctrl/cai_${ctrlseq}.txt -o2 ${dir}_out/ctrl/random_${ctrlseq}.txt -o3 ${dir}_out/ctrl/expected_${ctrlseq}.txt
	done

for toxseq in tox/*

	do
	 perl scripts/CAIcal_ECAI_v1.4.pl -f ${dir}tox/$toxseq -h codons/${cut}_CUT_Apr2017.txt -p 95 -n 500 -l 1000 -o1 ${dir}_out/tox/cai_${toxseq}.txt -o2 ${dir}_out/tox/random_${toxseq}.txt -o3 ${dir}_out/tox/expected_${toxseq}.txt
	done

done


#perl ../scripts/CAIcal_ECAI_v1.4.pl -f fasta/cct3.fas -h codons/chcut2.txt -p 95 -n 500 -l 548
#perl scripts/CAIcal_ECAI_v1.4.pl -f fasta/Aq/ctrl/Aqcct3.fasta -h codons/Aq_CUT_Apr2017.txt -p 95 -n 500 -l 548 -o1 cai_aq_cc.txt -o2 random_aq_cc.txt -o3 expected_aq_cc.txt
