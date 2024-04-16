#!/usr/bin/env bash
#$ -S /bin/bash
#$ -l s_vmem=4.5G
#$ -cwd
#$ -q '!mjobs_rerun.q'
#$ -pe def_slot 16
#$ -j y
#$ -N CellRanger
#$ -o log/scRNAseq/CellRanger/
#$ -hold_jid mkref

echo start
date

SRRID=`echo SRR22321958 SRR22321959 | cut -d " " -f ${SGE_TASK_ID}`

CellRanger=~/local/src/cellranger-7.2.0
PATH=$PATH:${CellRanger}
source ${CellRanger}/sourceme.bash
mkdir -p ../output/scRNAseq/CellRanger/${SRRID}
cd ../output/scRNAseq/CellRanger/${SRRID}

${CellRanger}/cellranger count \
--id=${SRRID} \
--fastqs=../../fastq/${SRRID} \
--sample=${SRRID} \
--transcriptome=../../CellRanger_ref/Homo_sapiens \
--localcores=16 \
--localmem=64

echo finish
date
