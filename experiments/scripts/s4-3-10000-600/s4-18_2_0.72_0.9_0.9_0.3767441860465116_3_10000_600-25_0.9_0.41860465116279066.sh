#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s4
srun ./simcjt 2 0.72 0.9 0.9 0.3767441860465116 3 10000 600 > out-s4-3-10000-600/s4-18_2_0.72_0.9_0.9_0.3767441860465116_3_10000_600-25_0.9_0.41860465116279066.out