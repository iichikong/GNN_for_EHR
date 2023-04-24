#!/bin/bash
#SBATCH --job-name=pre_eciu
#SBATCH --output=/scratch/ka2705/NLP/GNN_for_EHR/%j_%x.out
#SBATCH --error=/scratch/ka2705/NLP/GNN_for_EHR/%j_%x.err
#SBATCH --account=ds_ga_1012-2023sp
#SBATCH --partition=n1s8-v100-1
#SBATCH --time=04:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=5G
#SBATCH --requeue
#SBATCH --mail-type=END
#SBATCH --mail-user=ka2705@nyu.edu

singularity exec --nv --bind /scratch/ka2705/ --overlay /scratch/ka2705/overlay-25GB-500K.ext3:rw /scratch/ka2705/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /bin/bash -c "pwd; source /ext3/env.sh; conda activate; pip list; python3 /scratch/ka2705/NLP/GNN_for_EHR/data/eicu/preprocess_eicu.py --input_path /scratch/ka2705/NLP/GNN_for_EHR/data/eicu/pre_data/physionet.org/files/eicu-crd/2.0 --output_path /scratch/ka2705/NLP/GNN_for_EHR/data/eicu/out_data"
