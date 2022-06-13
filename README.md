# MiSEQ_testbarcodes
Script for testing false/true positive reads in a MiSEQ run with custom barcodes. Used for assessing cross talk and/or sample bleed over during extraction. Includes both custom barcodes and Illumina Nextera barcodes.

**Note: Probably only works on our servers in Center for Microbial Communities, Aalborg University, but feel free to adapt!**

# How to run
 - Load R and bcl2fastq modules (use `module spider` to search for the exact name)
`curl -fSsl https://github.com/cmc-aau/MiSEQ_testbarcodes/raw/master/script.sh | bash -s "/space/HiSeqUser/tempBackup/MiSeqBackup/RUNID"`

**What it does**
 - Writes out a complete SampleSheet with all nextera+custom V13 forward and reverse barcodes (including those not necessarily barcoded in the pooled library)
 - Runs bcl2fastq with the complete sample sheet
 - Counts ALL reads per fastq file (per barcode combination)
 - Compares the original SampleSheet used for the run with the complete SampleSheet to figure out false/true positive reads
 - Generates plots per barcode scheme (nextera+bv13fr) which shows the number of reads and colors by TP/FP
