#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=test
srun ./simcjt 2 0.04 0.0 0.9 0.03461538461538462 1000 3 300 > out-tests/test-1_2_0.04_0.0_0.9_0.03461538461538462_1000_3_300-25_0.9_0.038461538461538464.out