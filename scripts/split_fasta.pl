#!/usr/bin/env perl
#credits: BioPerl via https://www.biostars.org/p/76716/#76719

use strict;
use warnings;
use Bio::SeqIO;
my $in = Bio::SeqIO->new(-format => 'fasta',
                         -fh   => \*ARGV);
while( my $s = $in->next_seq ) {
    my ($id) = ($s->id);
    Bio::SeqIO->new(-format => 'fasta',
                    -file   => ">".$id.".fasta")->write_seq($s);
}