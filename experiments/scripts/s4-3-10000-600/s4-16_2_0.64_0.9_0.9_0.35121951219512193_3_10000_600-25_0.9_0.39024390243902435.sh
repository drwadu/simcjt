#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s4
srun ./simcjt 2 0.64 0.9 0.9 0.35121951219512193 3 10000 600 > out-s4-3-10000-600/s4-16_2_0.64_0.9_0.9_0.35121951219512193_3_10000_600-25_0.9_0.39024390243902435.out