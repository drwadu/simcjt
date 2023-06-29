#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s2
srun ./simcjt 2 0.28 0.3 0.9 0.065625 3 10000 600 > out-s2-3-10000-600/s2-7_2_0.28_0.3_0.9_0.065625_3_10000_600-25_0.3_0.21875000000000003.out