#!/bin/bash
#SBATCH --account=rob_gy_6203-2022fa    # ask for robot perception nodes
#SBATCH --partition=n1s8-v100-1         # specify the gpu partition
#SBATCH --nodes=1                       # requests 1 compute server
#SBATCH --ntasks-per-node=1             # runs 1 task on each server
#SBATCH --cpus-per-task=2               # uses 2 compute cores per task
#SBATCH --time=1:00:00                  # for one hour
#SBATCH --mem=2GB                       # memory required for job
#SBATCH --job-name=torch-test           # name of the job
#SBATCH --output=result.out             # file to which output will be written
#SBATCH --gres=gpu:v100:1               # To request specific v100 GPU

## Initialize conda
source /scratch/amw9425/env.sh;

## activate your environment
conda deactivate; ## this is needed for some reason, which I don't know yet
conda activate torch;

## run your code
python test.py;