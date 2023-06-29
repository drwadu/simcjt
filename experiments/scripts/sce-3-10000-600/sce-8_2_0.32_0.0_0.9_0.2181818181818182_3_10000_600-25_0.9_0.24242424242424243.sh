#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=sce
srun ./simcjt 2 0.32 0.0 0.9 0.2181818181818182 3 10000 600 > out-sce-3-10000-600/sce-8_2_0.32_0.0_0.9_0.2181818181818182_3_10000_600-25_0.9_0.24242424242424243.out