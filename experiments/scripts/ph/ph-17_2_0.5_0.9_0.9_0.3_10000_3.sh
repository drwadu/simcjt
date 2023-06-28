#!/bin/bash
#SBATCH --account=p_jury 
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=ph-17_2_0.5_0.9_0.9_0.3_10000_3
srun ./cjt-simulation-600 2 0.5 0.9 0.9 0.3 10000 3 > ph-results/ph-17_2_0.5_0.9_0.9_0.3_10000_3.out