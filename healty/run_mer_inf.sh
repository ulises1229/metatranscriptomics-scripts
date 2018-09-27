#!/bin/bash
#SBATCH --partition LARGEMEM
#SBATCH --nodes=1
#SBATCH --cpus-per-task=45
#SBATCH --mem=64G
#SBATCH --time=40-15:15:00     # 1 day 15hours and 15 minutes
#SBATCH --output=s3-inf-merged-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=uolivares@enesmorelia.unam.mx
#SBATCH --job-name="s3-h-inf-merged"

# cmsearch infernal output 
srun parallel -j 1 'cmsearch --cpu 45 -o {1.}.log --tblout {1.}.infernalout --anytrunc --rfam -E 0.001 Rfam.cm {1}' ::: *merged*bwa_blat.fasta
