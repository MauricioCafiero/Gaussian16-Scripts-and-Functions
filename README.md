# Gaussian16-Scripts-and-Functions
Useful bash functions and scripts for running Gaussian 16 on Linux with a queueing system (slurm in this case)

## set-up
- The script submit_g16.sh should be somewhere on your PATH, such as ~/bin.
- For this script, the slurm file, template.slurm, should be in ~/scripts. You can place it in a different folder, just change line 19 in submit_g16.sh accordingly.
- Copy the functions from g16_functions.txt into your .bash_profile or .bash_rc file.

## functionality
- Submit a single gaussian job to the slurm queue with one of the following (gjf can be used rather than com if desired)
  ```
  submit_g16.sh yourfile.com
  submit_g16.sh yourfile.com ###
  ```
  in this example, ### represents the number of cores for your job. if you do not specify the number of cores, it will default to 32. Memory is set to ###GB as well.
  * The script will create a slurm file by copying the template and adding a line to fun yourfile.com. 
  * The script will set memory and cores in both the .com and slurm files to your input or the default. This depends on using the Gaussian keywords %mem=(some number) and %nprocshared=(some number) in your .com files. The script witll subsititute whatever is there for your input number.
  * Finally the script submits your file.
- Submit all .com files in your directory:
  ```
  runall
  runall ###
  ```
  * this finds all .com files (can be easily changed to .gjf) in your directory and submits each to the slurm queue.
  * if you specify ###, that number of cores will be used. Otherwise it defaults to 32.
- Check energies in output files: 
