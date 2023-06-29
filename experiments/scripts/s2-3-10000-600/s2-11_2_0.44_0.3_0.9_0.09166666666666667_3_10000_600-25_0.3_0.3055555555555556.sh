#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s2
srun ./simcjt 2 0.44 0.3 0.9 0.09166666666666667 3 10000 600 > out-s2-3-10000-600/s2-11_2_0.44_0.3_0.9_0.09166666666666667_3_10000_600-25_0.3_0.3055555555555556.out