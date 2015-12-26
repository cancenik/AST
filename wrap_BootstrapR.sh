#!/usr/bin/bash

FILES=*.BOTH

for f in $FILES
	do
		
		IFS='.' read -a array2 <<< "$f"
		echo ${array2[0]}
		cp $f ./${array2[0]}/$f
		cp ./Bootstrap.R ./${array2[0]}/Bootstrap.R
		cd ./${array2[0]}
		qsub -cwd -o $f.out -e $f.err ./Bootstrap.R $f ${array2[0]}
		cd ..
	done
