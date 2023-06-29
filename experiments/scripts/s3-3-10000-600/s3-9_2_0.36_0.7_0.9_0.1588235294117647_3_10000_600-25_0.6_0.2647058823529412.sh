#!/bin/bash
#SBATCH --account=p_jury
#SBATCH --partition=haswell
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=168:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=doru415d@tu-dresden.de
#SBATCH --job-name=s3
srun ./simcjt 2 0.36 0.7 0.9 0.1588235294117647 3 10000 600 > out-s3-3-10000-600/s3-9_2_0.36_0.7_0.9_0.1588235294117647_3_10000_600-25_0.6_0.2647058823529412.out