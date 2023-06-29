#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s1
srun ./simcjt 2 0.8 0.0 0.9 0.26666666666666666 3 10000 600 > out-s1-3-10000-600/s1-20_2_0.8_0.0_0.9_0.26666666666666666_3_10000_600-25_0.6_0.4444444444444445.out