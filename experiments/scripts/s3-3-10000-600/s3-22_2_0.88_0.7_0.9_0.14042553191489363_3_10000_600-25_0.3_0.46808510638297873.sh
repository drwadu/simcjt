#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s3
srun ./simcjt 2 0.88 0.7 0.9 0.14042553191489363 3 10000 600 > out-s3-3-10000-600/s3-22_2_0.88_0.7_0.9_0.14042553191489363_3_10000_600-25_0.3_0.46808510638297873.out