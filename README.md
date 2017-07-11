
This repo is for calculating codon adaptation indices.

## Setup guide

* `CAIcal_ECAI_v1.4.pl`
	- [Codon adaptation index calculator](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2553769/). 
	- [web version](http://genomes.urv.es/CAIcal/)
	- [local verison](http://genomes.urv.es/CAIcal/formulari.php)
	- [CAIcal manual](http://genomes.urv.es/CAIcal/tutorial.pdf)
* `setup_wd.sh`
	- This script sets up the working environment.
* `batch_execute.sh`
	- This script splits the FASTA files and runs the CAI calculator.
	- Each genome's genes are calculated against its own CUT table, based on the genes in the `ctrl` folder of each directory.
	- Gene CAIs are calculated individually so that AA/GC composition of the synthetic genes match the query.

## Parameter guide

```
-e cai|expected|cai_and_expected|rcdi|ercdi|rcdi_and_ercdi       <defaults: cai_and_expected>            #Option 'cai' calculates CAI from DNA sequences and option 'expected' calculates, expected CAI and option 'cai_and_expected' calculates both.
-f  file_name #DNA sequence in fasta format
-h  file_name #Codon usage file
-g genetic_code #use default: 1
-c confidence #default 95
-p population #99
-gc %GC #optional
-n number of sequences #default: 1000
-l length #default: 300
-m method #markov or poisson.  markov default.
-s split sequences #default no.

```

` -f cct3.fas -h chcut2.txt -p 95 -n 500 -l 548`


##notebook

Confirm that codon usage tables are correct.

* Run fASTA through EMBOSS converter tool to clean
* Remove all headers `>*.`
* Submit to http://www.kazusa.or.jp/codon/countcodon.html

Done for C4, CUTs match.


