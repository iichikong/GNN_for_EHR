#!/bin/bash
#SBATCH --job-name=pre_mimic
#SBATCH --output=/%j_%x.out
#SBATCH --error=/%j_%x.err
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --mem=2GB
#SBATCH --time=10:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=ka2705@nyu.edu

module purge
module load python/intel/3.8.6

source /scratch/ka2705/nlu/bin/activate
srun /scratch/ka2705/nlu/bin/python ./data/mimic/preprocess_mimic.py --input_path ./data/mimic/pre_data/physionet.org/files/mimiciii/1.4 --output_path ./data/mimic/out_data
