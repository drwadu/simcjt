#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s3
srun ./simcjt 2 0.52 0.7 0.9 0.10263157894736842 3 10000 600 > out-s3-3-10000-600/s3-13_2_0.52_0.7_0.9_0.10263157894736842_3_10000_600-25_0.3_0.34210526315789475.out