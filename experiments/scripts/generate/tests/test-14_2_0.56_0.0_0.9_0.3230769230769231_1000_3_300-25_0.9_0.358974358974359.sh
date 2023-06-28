#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=test
srun ./simcjt 2 0.56 0.0 0.9 0.3230769230769231 1000 3 300 > out-tests/test-14_2_0.56_0.0_0.9_0.3230769230769231_1000_3_300-25_0.9_0.358974358974359.out