
####################################################################################################################

Parameters to run CAIcal:

$ perl CAIcal_v1.4.pl -e [cai|expected|cai_and_expected] -f [file_name] -h [file_name] -g [1|4|11] -c [90|95|99] -p [90|95|99] -o1 [file_name] -o2 [file_name] -o3 [file_name] -n [number] -l [number] -m [markov/poisson] -gc [0-100]-s [y/n]

* PROGRAM EXECUTION:                    -e cai|expected|cai_and_expected|rcdi|ercdi|rcdi_and_ercdi      <defaults: cai_and_expected>            #Option 'cai' calculates CAI from DNA sequences and option 'expected' calculates, expected CAI and option 'cai_and_expected' calculates both.

* INPUT1 DATA FILE:                     -f file_name                          <default: example.ffn>                  #DNA sequences in fasta format

* INPUT2 HOST FILE:                     -h file_name                          <default: human>                        #Codon usage reference table to calculate CAI.

* GENETIC CODE:                         -g  1|2|3|4|5|6|9|10|11|12|13|14|15    <default: 1>                           # code 1) Standard 11) Eubacteria 4) Mycoplasma ...

* CONFIDENCE:	                        -c 90|95|99                            <default: 95>

* POPULATION:	                        -p 90|95|99                            <default: 99>

* %G+C:		                        -gc 0-100	                       <default: ->			     # Optional parameter

* OUTPUT1 (CAI):                        -o1 file_name	                       <default: ./cai>

* OUTPUT2 (CAI random sequences):	-o2 file_name	                       <default: ./random_sequences_and_cai>

* OUTPUT3 (EXPECTED CAI):               -o3 file_name	                       <default: ./expected>	

* NUMBER OF SEQUENCES:                  -n number	                       <default: 1000>                         #1000 Sequences

* LENGTH OF SEQUENCES:                  -l number	                       <default: 300>                          # 300 codons

* METHODS FOR RANDOM SEQUENCES          -m markov/poisson                      <default: markov>                       # Markov or Poisson method

* SPLIT SEQUENCES      			    -s y/n                      		<default: n>                      	 # y:yes -> To estimate eCAI and CAI/eCAI one by one sequence / n:no

* HELP                                  -help

##############################################################################################################




