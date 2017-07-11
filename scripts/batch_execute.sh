#!/bin/bash

mkdir out

for dir in  fasta/*/

do
	prefix="fasta/"
	suffix="/"
	dir=${dir#$prefix};
	dir=${dir%$suffix};

	## Set up working directory first
	mkdir out/${dir}
	mkdir out/${dir}/out
	mkdir out/${dir}/out/tox
	mkdir out/${dir}/out/ctrl

	for ctrlseq in fasta/${dir}/ctrl/*
	do
		gene=${ctrlseq#"fasta/$dir/ctrl/"}
		gene=${gene%".fasta"}

	length=$(tail -n +2 ${ctrlseq} | tr -d '\n' |   wc -c | awk '{print $1/3}')

	 perl scripts/CAIcal_ECAI_v1.4.pl -f $ctrlseq -h codons/${dir}_CUT_Apr2017.txt -p 95 -n 500 -l ${length} -o1 out/${dir}/out/ctrl/cai_${gene}.txt -o2 out/${dir}/out/ctrl/random_${gene}.txt -o3 out/${dir}/out/ctrl/expected_${gene}.txt
	done

for toxseq in fasta/${dir}/tox/*

	do
		gene=${ctrlseq#"fasta/Aq/ctrl/"}
		gene=${gene%".fasta"}

			length = tail -n +2 ${ctrlseq} | tr -d '\n' |   wc -c | awk '{print $1/3}'

	 perl scripts/CAIcal_ECAI_v1.4.pl -f $toxseq -h codons/${cut}_CUT_Apr2017.txt -p 95 -n 500 -l ${length} -o1 out/${dir}/out/tox/cai_${gene}.txt -o2 out/${dir}/out/tox/random_${gene}.txt -o3 out/${dir}/out/tox/expected_${gene}.txt
	done

done


#perl ../scripts/CAIcal_ECAI_v1.4.pl -f fasta/cct3.fas -h codons/chcut2.txt -p 95 -n 500 -l 548
#perl scripts/CAIcal_ECAI_v1.4.pl -f fasta/Aq/ctrl/Aqcct3.fasta -h codons/Aq_CUT_Apr2017.txt -p 95 -n 500 -l 548 -o1 cai_aq_cc.txt -o2 random_aq_cc.txt -o3 expected_aq_cc.txt
