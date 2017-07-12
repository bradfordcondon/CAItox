This notebook tests the codon usage tables (CUT)s for each species TOX and control sets directly (instead of using CAI).

## Overview

The overall approach is :
* Generate CUTs (2 for each taxon: tox and control)
* load CUTs into R
* Calculate distance matrix between CUTs
* Track metadata for CUT with two factors: species and gene type (tox/control)

## Useage

* Supply CUTs.  `scripts/createCUT` automates the creation of toxin-based CUTs.
* R script is designed to simply load in tox and control gene CUTs.  Adding additional gene groups will require changing the script.

## Results

Script still under construction...