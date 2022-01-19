#!/bin/bash

#!/bin/bash
#SBATCH --job-name=nvidia-smi
#SBATCH --output=nvidia-smi.out
#SBATCH --error=nvidia-smi.err

echo $(nvidia-smi)