#!/bin/bash

if [ -z "$1" ]; then
    echo No input filname provided!
else
    input=$1
    basename=${input%.*}
    slurmname="$basename.slurm"

    if [ -z "$2" ]; then
        echo No number of cores provided, using 32
        procs_in=32
    else
        procs_in=$2
    fi
    procs=$(($procs_in / 2))
    mem=${procs_in}

    cp ~/scripts/template.slurm $slurmname
    sed -i "s/tasks=/tasks=$procs/" $slurmname
    sed -i "s/mem=/mem="$mem"GB/" $slurmname
    sed -i "s/name=/name=$basename/" $slurmname
    sed -i "s/red=[0-9][0-9]*[0-9]*/red=$mem/" $input
    sed -i "s/mem=[0-9][0-9]*[0-9]*GB/mem="$mem"GB/" $input

    echo "g16 $input" >> $slurmname
    sbatch $slurmname
    echo "$basename submitted"
fi
