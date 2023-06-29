#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s3
srun ./simcjt 2 0.96 0.7 0.9 0.29387755102040813 3 10000 600 > out-s3-3-10000-600/s3-24_2_0.96_0.7_0.9_0.29387755102040813_3_10000_600-25_0.6_0.4897959183673469.out