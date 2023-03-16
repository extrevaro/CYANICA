#!/bin/bash -euo pipefail
for run in SRR17288263 SRR17288264; do
    prefetch --max-size 1000000000000 $run
    fasterq-dump $run -e 1
done

if [ "SINGLE" = "SINGLE" ]; then
    pigz -c *.fastq > SRX13465629_1.fastq.gz
else
    pigz -c *_1.fastq > SRX13465629_1.fastq.gz
    pigz -c *_2.fastq > SRX13465629_2.fastq.gz
fi
