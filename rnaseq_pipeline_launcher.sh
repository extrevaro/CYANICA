#!/bin/bash

#SBATCH -J sbatch_ok_opts_in_file
#SBATCH -o rna.output
#SBATCH -e rna.errors
#SBATCH --mem=128000
#SBATCH --time=0
#SBATCH --cpus-per-task=32

projectdir="Species/Synechocystis_sp_PCC_6803/"
metadatafolder="metadata/"
seqfolder="sequence_files/"
outfolder="nf_results/"
metadatadir=$projectdir$metadatafolder
outdir=$projectdir$outfolder
seqdir=$projectdir$seqfolder

while getopts m:o: flag
do
	case "${flag}" in
		m) metadatafn=${OPTARG};;
		o) outpath=${OPTARG};;
	esac
done

metafile=$metadatadir$metadatafn
out=$outdir$outpath

nextflow run main.nf -profile local --organism txid1148 --metadata $metafile --sequence_dir $seqdir --outdir $out
