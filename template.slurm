#!/bin/bash
#SBATCH --job-name=    # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=xxx@xxx     # Where to send mail	
#SBATCH --ntasks=                   # Run on a X cores
#SBATCH --mem=                     # Job memory request
#SBATCH --time=24:00:00               # Time limit hrs:min:sec
#SBATCH --nodes=1               # number of nodes
#SBATCH --output=test_%j.log   # Standard output and error log
pwd; hostname; date

echo "Running g16 calculation"

