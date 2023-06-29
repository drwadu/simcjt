#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s3
srun ./simcjt 2 0.16 0.7 0.9 0.12413793103448278 3 10000 600 > out-s3-3-10000-600/s3-4_2_0.16_0.7_0.9_0.12413793103448278_3_10000_600-25_0.9_0.13793103448275865.out