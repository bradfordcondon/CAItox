
This repo is for calculating codon adaptation indices.

## Setup guide

`CAIcal_ECAI_v1.3.pl`

* [Codon adaptation index calculator](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2553769/). 
	- [web version](http://genomes.urv.es/CAIcal/)
	- [local verison](http://genomes.urv.es/CAIcal/formulari.php)
	- [CAIcal manual](http://genomes.urv.es/CAIcal/tutorial.pdf)

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






## Background notes from Jon

### CAI

>From Puigbo et al 2008:
The codon adaptation index quantifies the similarity between the synonymous codon usage of a gene, and the synonymous codon frequency of a reference set

The CAI index ranges from 0 to 1, with 1 being if a gene always uses the most frequently
	used synonymous codons in the reference set. 

>From Sharp et al 1987:
The other Sharp et al 1986, suggests calculation of chi square value for the deviation from random codon usage, scaled by the length of the gene

CAI is normalized and so is good for making comparisons within and between species

* 1st step in CAI is to construct a 'relative synonymous codon usage' table. 
	- RSCU: value for a codon, observed frequency of that codon divided by the frequency
	- expected under assumption of equal usages of synonymous codons for the aa

* [CAI online calculation tool](http://ppuigbo.me/programs/CAIcal/).
* [Codon usage table calculator](http://www.kazusa.or.jp/codon/countcodon.html)

### Synonymous codon usage bias

Several different codons specify the same amino acid
Codon bias describes the bias within a gene (preference) for certain codons in specifying an amino acid

### How to describe "CAI"

A reference dataset of genes is used to generate numeric scores representing relative codon preference within the genome. Codons with higher scores represent codons 

The CAI score of a gene is the proportion of codon use relative to the preferred codons, as calculated in the reference dataset.  
	
If CAI were 1, then the codons used in specifying the aa in the gene, are all the preferred
codons as determined by the reference dataset. This is considered to be "adaptive", 
in that it is assumed that higher values of CAI reflect increased translational 
efficiency within the organism.

If CAI is low, then the gene is not using the preferred codons, and thus is not translated
as efficiently.

Authors suggest that low CAI values for a gene represent possible HGT events, in that the 
gene/codon composition has not been optimized for the genome within which it is found.
And that it may be possible to determine the origin of the gene based on comparing the
CAI of the gene if found in alternate host (so...if CAI is calculated for a gene, using
a different host's reference dataset, and the CAI is higher, then the gene is more 
optimized for that genome, and may have come from that genome originally). Authors 
also suggest that if transfer occurs regularly (as in bacterial plasmids), the gene 
may not become optimized to any genome, and so may have low CAI regardless of the 
reference set evaluated. 


The Codon Usage Table format of CAIcal is as follows:
fields:	[triplet]	[frequency: per thousand]	([number])
ex.		UUU			14.6						(2257)

Number: count for each codon as a sum of all CDS's

In order to have a way to check to see if my table is correct, I am attempting to use 
	CAIcal to calculate a codon usage table for one gene in Ch. Then I will be able to
	compare my coding output to this. Perhaps I should do several genes?

Minor discrepancy in the CAIcal database version of PKS1 and the NCBI version of PKS1 that
	I have just downloaded. CAIcal says 2729 aa positions, I have 2728 downloaded from
	NCBI (GenBank: U68040.3). The version that is now in NCBI is a newer version, deposited
	in 2009. I'm not sure how 1aa could be off, unless it is the stop codon? I do not have 
	a stop codon in the new version, maybe I should translate from the nt in NCBI...
	YES. that is it. The aa shown in NCBI does not include the stop, but the nt does 
	have the stop, when translated- produces 2529aa.

So I will assume that the nt from NCBI can be used to calculate the codon usage table 
	for this individual gene and that my calculations should match.

Next steps:
1. Gather all nt's for the conserved sequences for each species, ensuring
	that stop codons are present, and then create a CUT using this tool. 
	1a. i don't have the stop codons. i am going to assemble the spp datasets, and see 
	how long it takes to get them. 
	1b. got all Ch stop codons, took about 3-4 songs on pandora. 
2. Assemble all Tox1 nt's by species into individual species datasets, ensuring stop codons present
3. Run full factorial CAI analysis, Kazusa allows for analysis of 2 CUT's at a time.

Got all Ch conserved dna with stop codons
Assembling all tox1 cluster by species
Decided to assemble Tox1 clusters with the full PKS1 and PKS2 nt (not just KS)

Test run of codon usage table generator in CAIcal server, using Chet C4 conserved dna
	Got CUT for ChetC4, no apparent problems.
	Running CAI of ChTox1 genes against ChetC4 reference
	Got data. CAI are very low, range 0.595-0.664. 
Not sure if these low numbers are indicative of bad fit of codons to the genome, or if the
	reference data set is not adequate somehow. 
My initial thought is that these are not a very good fit for the genome.
The numbers of effective codons (Nc) are all very high, ChOxi1 is actaully 61.0, which is 
	a perfect score, indicating completely random codon usage, with no indication of 
	preference within the gene for codon specification.

On to Cc conserved sequences. Pulling the stop codons
	CcPKS2, dropped the last two nt to end with a final triplet

Running CUT generator using Cc conserved seqeunces.
	Looks fine
Running CcTox1 against ChetC4 and Cc ref's
	Interestingly, CcTox1 has higher scores in the Chet background than it's own.
Running ChTox1 against Cc ref
	Interestingly, ChTox1 does better in it's own genome than in the Cc genome, which is
	the opposite pattern seen in CcTox1

The system is apparently working, from here out- I will assemble all remaining 
	datasets and then proceed with analysis.

Ch datasets assembled (as described above)
Cc datasets assembled (as described above)
Lin datasets assembled
Lm datasets assembled
Pra datasets assembled
DZM: not sure what is up with Lys1. Looks like Sc aa had 2 hits?
	Blastp using ScLys1: hits Dzm 18442 + 15589, half on each Dzm protein.
	The DzmLys1 sequence I used in the phylo analysis was both 18442+15589 composite
		(confirmed via Blastp)
	Not sure why my spreadsheet says DzmLys1 is composed of Dzm18442+15881, 15881 does not
		align to the DzmLys1 sequence I used in the phylo analysis, nor is it a hit when I 
		Blastp using ScLys1.
	DzmLys1 is correct and complete. The aa used is composed of both Dzm18442+15589, 
		I have all nt and the stop codon. I dropped one nt from the end of Dzm18442 
		as this extra nt caused an incomplete triplet
Pbr datasets assembled
Ca datasets assembled, included all available PKS1
Aq datasets assembled
Ar rpt2 is not a clearly called gene. I am going to skip this one in the sake of time.
	I would have to call the nt from the genomic dna. 
Ar datasets assembled


Sample code to execute:

perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f cct3.fas -h chcut2.txt -p 95 -n 500 -l 548
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f chc1.fas -h chcut2.txt -p 95 -n 500 -l 1835
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f frs2.fas -h chcut2.txt -p 95 -n 500 -l 539
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f chpks1.txt -h chcut2.txt -p 95 -n 500 -l 300
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f linpks1.fas -h chcut2.txt -p 95 -n 500 -l 300
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f chpksother.fas -h chcut2.txt -p 95 -n 500 -l 300
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f testred.fas -h chcut2.txt -p 95 -n 500 -l 100
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f chpks1.txt -h chcut2.txt -p 95 -n 500 -l 100
perl /Applications/CAIcal_ECAI_v1.3_source/CAIcal_ECAI_v1.3.pl -f linpks1.fas -h chcut2.txt -p 95 -n 500 -l 100



I checked three randomly generated sequences of ChPKS1 against the true ChPKS1 to ensure 
	that randomly generated sequences are correctly generating AA %'s and GC content. 
	
Aa percentages for all three were within 1% of true aa percentages, except for only 3aa
	of ~60. 
All GC percentages of three randomly generated sequences were within 1 percent of true 
	ChPKS1 GC.

##########################################################################################

21 June 2017
Running CAI analysis of each individual PKS gene in Ch against codon reference tables
composed of all remaining PKS genes in Ch. Therefore, the gene being tested is not within
the data used to generate the codon reference table. 

Starting from the top (ChPKS1) and generating CUT for all remaining PKS genes.

All cut's prepared. 
All individual nt sequence files prepared.
Have all aa length data.
Ready to process.


##########################################################################################
6 July 2017
Ok, new approach. I have C5 expression data from Ben Horowitz. I have identified the 
species tree gene orthologs in this data set and have found that they fall within approx
"average" expression level, and so are probably not the most appropriate genes to be using
in the CAI analysis. 

New approach. Choosing from the 250 most highly expressed genes. 
Assigning random number 1-250 to these genes. 
Selecting each 10 value as the randomly selected gene. 

Getting data for each gene to show Gillian prior to using as a reference gene. Gillian
indicates to definitely not use Mitochodrial genes. 

Ok, there were 7 genes that were "hypothetical" or that had no predictive information, and
6 genes that were predicted to code for ribosomal proteins. Waiting on comments from BGT.

Ok, BGT suggests using one 40s and one 60s at most. 
Substitutions:
151 (ATP-citrate lyase) for 150. 
172 for 170
181 for 180
248 for 250
