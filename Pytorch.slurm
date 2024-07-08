#!/bin/bash
#SBATCH --job-name=SGFormer  # Job name
#SBATCH --partition=gpu               # Select partition,dgx,grtx 
#SBATCH --cpus-per-task=4               # Run on a 4 cores per node
#SBATCH --nodes=1                       # Run on a 1 node
#SBATCH --ntasks=1                      # One process (shared-memory)
#SBATCH --mem=256gb                     # Job memory request
#SBATCH --gres=gpu:a100:1                    # Request one GPU
#SBATCH --output=output/tbst_%j.log   # Standard output and error log
#SBATCH --error=output/error_%j
#SBATCH --mail-type=END,FAIL          #BEGIN, #Mail events
#SBATCH --mail-user=sepideh.neshatfar@maine.edu


echo "====================================================="
pwd; hostname; date
echo "====================================================="

# module load gnu8/8.3.0 mvapich2/2.3.2  /21.08
echo "Loading modules"
module load anaconda3 
echo "Modules loaded"

. $CONDA_BIN/conda-init
conda activate SGFormer

srun python "$@"
echo "====================================================="
date

