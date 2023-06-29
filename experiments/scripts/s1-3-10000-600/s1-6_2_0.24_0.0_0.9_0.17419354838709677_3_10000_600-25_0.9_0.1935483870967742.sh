#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s1
srun ./simcjt 2 0.24 0.0 0.9 0.17419354838709677 3 10000 600 > out-s1-3-10000-600/s1-6_2_0.24_0.0_0.9_0.17419354838709677_3_10000_600-25_0.9_0.1935483870967742.out