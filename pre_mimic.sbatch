#!/bin/bash
#SBATCH --job-name=pre_mimic
#SBATCH --output=pre_mimic.out
#SBATCH --error=pre_mimic.err
#SBATCH --gres=gpu:1
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=10GB
#SBATCH --time=10:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=ka2705@nyu.edu

module purge
module load python/intel/3.8.6

source /scratch/ka2705/nlu/bin/activate
srun /scratch/ka2705/nlu/bin/python ./data/mimic/preprocess_mimic.py --input_path ./data/mimic/pre_data/physionet.org/files/mimiciii/1.4 --output_path ./data/mimic/post_data
