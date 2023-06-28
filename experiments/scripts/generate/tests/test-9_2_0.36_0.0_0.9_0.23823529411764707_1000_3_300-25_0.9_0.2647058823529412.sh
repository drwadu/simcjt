#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=test
srun ./simcjt 2 0.36 0.0 0.9 0.23823529411764707 1000 3 300 > out-tests/test-9_2_0.36_0.0_0.9_0.23823529411764707_1000_3_300-25_0.9_0.2647058823529412.out