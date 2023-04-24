#/bin/bash
#SBATCH --job-name=tarin_mimic
#SBATCH --output=train_mimic.out
#SBATCH --error=train_mimic.err
#SBATCH --gres=gpu:1
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=10GB
#SBATCH --time=10:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=ka2705@nyu.edu

module purge
module load python/intel/3.8.6

source /scratch/ka2705/nlu/bin/activate
srun /scratch/ka2705/nlu/bin/python ./train.py --data_path ./data/mimic/post_data/ --embedding_size 512 --result_path .

