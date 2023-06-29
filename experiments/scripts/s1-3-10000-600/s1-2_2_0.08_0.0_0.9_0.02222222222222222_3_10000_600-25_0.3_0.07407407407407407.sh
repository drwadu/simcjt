#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s1
srun ./simcjt 2 0.08 0.0 0.9 0.02222222222222222 3 10000 600 > out-s1-3-10000-600/s1-2_2_0.08_0.0_0.9_0.02222222222222222_3_10000_600-25_0.3_0.07407407407407407.out