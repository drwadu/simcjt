#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s4
srun ./simcjt 2 0.6 0.9 0.9 0.11249999999999998 3 10000 600 > out-s4-3-10000-600/s4-15_2_0.6_0.9_0.9_0.11249999999999998_3_10000_600-25_0.3_0.37499999999999994.out