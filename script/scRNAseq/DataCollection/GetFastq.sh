#!/usr/bin/env bash
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=10G
#$ -j y
#$ -o log/scRNAseq/GetSra/
#$ -N GetSra

echo start
date

SRRID=`echo SRR22321958 SRR22321959 | cut -d " " -f ${SGE_TASK_ID}`
mkdir -p ../output/scRNAseq/fastq/${SRRID}

. ~/miniconda3/etc/profile.d/conda.sh
conda activate BasicNGS
prefetch --output-directory ../output/scRNAseq/sra/ ${SRRID}

echo finish
date
