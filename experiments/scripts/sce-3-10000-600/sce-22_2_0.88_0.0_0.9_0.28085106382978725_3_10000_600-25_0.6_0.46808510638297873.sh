#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=sce
srun ./simcjt 2 0.88 0.0 0.9 0.28085106382978725 3 10000 600 > out-sce-3-10000-600/sce-22_2_0.88_0.0_0.9_0.28085106382978725_3_10000_600-25_0.6_0.46808510638297873.out