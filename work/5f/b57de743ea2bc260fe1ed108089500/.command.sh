#!/bin/bash -euo pipefail
for run in SRR17288265 SRR17288266 SRR17288267; do
    prefetch --max-size 1000000000000 $run
    fasterq-dump $run -e 1
done

if [ "SINGLE" = "SINGLE" ]; then
    pigz -c *.fastq > SRX13465630_1.fastq.gz
else
    pigz -c *_1.fastq > SRX13465630_1.fastq.gz
    pigz -c *_2.fastq > SRX13465630_2.fastq.gz
fi
