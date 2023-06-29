#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s1
srun ./simcjt 2 0.84 0.0 0.9 0.13695652173913045 3 10000 600 > out-s1-3-10000-600/s1-21_2_0.84_0.0_0.9_0.13695652173913045_3_10000_600-25_0.3_0.4565217391304348.out