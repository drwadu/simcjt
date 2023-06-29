#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=35_2_0.5_0.875_0.9_0.3_50000_3_600
srun ./simcjt 2 0.5 0.875 0.9 0.3 50000 3 600 > out-fdp-3-50000-600/35_2_0.5_0.875_0.9_0.3_50000_3_600.out