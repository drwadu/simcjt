#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s4
srun ./simcjt 2 0.32 0.9 0.9 0.07272727272727272 3 10000 600 > out-s4-3-10000-600/s4-8_2_0.32_0.9_0.9_0.07272727272727272_3_10000_600-25_0.3_0.24242424242424243.out