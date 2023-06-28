#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=test
srun ./simcjt 2 0.12 0.0 0.9 0.03214285714285713 1000 3 300 > out-tests/test-3_2_0.12_0.0_0.9_0.03214285714285713_1000_3_300-25_0.3_0.10714285714285712.out