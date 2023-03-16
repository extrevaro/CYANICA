#!/bin/bash -euo pipefail
cat plasmid_pSYSM.fasta plasmid_pSYSG.fasta plasmid_pSYSX.fasta genome.fasta plasmid_pSYSA.fasta > txid1148.fasta
bowtie-build --threads 1 txid1148.fasta index
bowtie-build -C --threads 1 txid1148.fasta cspace_index
