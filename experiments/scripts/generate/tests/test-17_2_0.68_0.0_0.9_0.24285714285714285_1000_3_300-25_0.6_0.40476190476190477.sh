#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=test
srun ./simcjt 2 0.68 0.0 0.9 0.24285714285714285 1000 3 300 > out-tests/test-17_2_0.68_0.0_0.9_0.24285714285714285_1000_3_300-25_0.6_0.40476190476190477.out