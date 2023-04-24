#!/bin/bash
#SBATCH --job-name=pre_eicu
#SBATCH --output=pre_eicu.out
#SBATCH --error=pre_eicu.err
#SBATCH --gres=gpu:1
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=10GB
#SBATCH --time=10:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=ka2705@nyu.edu

module purge
module load python/intel/3.8.6

source /scratch/ka2705/nlu/bin/activate
srun /scratch/ka2705/nlu/bin/python ./data/eicu/preprocess_eicu.py --input_path ./data/eicu/pre_data/physionet.org/files/eicu-crd/2.0 --output_path ./data/eicu/post_data
