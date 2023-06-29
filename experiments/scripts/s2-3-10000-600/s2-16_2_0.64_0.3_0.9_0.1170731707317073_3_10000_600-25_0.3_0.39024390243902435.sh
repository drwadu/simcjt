#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s2
srun ./simcjt 2 0.64 0.3 0.9 0.1170731707317073 3 10000 600 > out-s2-3-10000-600/s2-16_2_0.64_0.3_0.9_0.1170731707317073_3_10000_600-25_0.3_0.39024390243902435.out