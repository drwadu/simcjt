#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=sce
srun ./simcjt 2 0.12 0.0 0.9 0.06428571428571427 3 10000 600 > out-sce-3-10000-600/sce-3_2_0.12_0.0_0.9_0.06428571428571427_3_10000_600-25_0.6_0.10714285714285712.out