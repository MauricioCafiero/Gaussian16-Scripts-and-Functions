# Gaussian16-Scripts-and-Functions
Useful bash functions and scripts for running Gaussian 16 on Linux with a queueing system (slurm in this case)

## set-up
- The script submit_g16.sh should be somewhere on your PATH, such as ~/bin.
- For this script, the slurm file, template.slurm, should be in ~/scripts. You can place it in a different folder, just change line 19 in submit_g16.sh accordingly.
- Copy the functions from g16_functions.txt into your .bash_profile or .bash_rc file. Be sure to source the file after pasting to use immediately. Othewise functions are read upon opening a shell and available from the command line.

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
  ```
  geten
  geten yourfile.log
  geten -c
  geten -c yourfile.log
  ```
  * with no options arguements, this function greps "SCF Done" on all log files and returns the result, if a file is provided it greps only that file.
  * the -c option cuts only the energy value out of the output and returns just the number. Useful to paste into a spreadsheet, for example. Can be used with or without a filename.
- Check optimization status:
  ```
  geom -[mrda] yourfile.log
  ```
  * greps and returns either "Maxiumum Force", "RMS     Force", "Maximum Displacement" or "RMS     Displacement" with the options -m, -r, -d, and -a. Only one option can be used, so if multiple options are provided, the function only uses the last one. A filename must be provided.
- Clean up files from calculations:
  ```
  cg16all -[scflk]
  ```
  * removes the specified files: slurm (-s), chk (-c), fchk (-f), log (-l), cube (-k). More than one option can be specified and all will be removed.
- Clean up files with a menu (for the hesitant deleter):
  ```
  cg16ch 
  ```
  * prompts the user for what types of files to delete.
- Clean scratch space
  ```
  cleang16scratch
  ```
  * removes all files begining with "Gau" from the scratch directory (as specificed by $GAUSS_SCRDIR) 
