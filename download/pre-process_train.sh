#!/usr/bin/bash
#extract from dir
a='
cat train.txt|while read hash
do
	for i in {0..99}
	do
		filename=$(printf "frame%04d.png" $i)
		eval "cp ../train/data/${hash}/${filename} ../train/data/${hash}_${filename}"
		
	done

done
'
#examine correctness

#cat train.txt|while read hash
#do
#	for i in {0..99}
#	do
#		filename=$(printf "${hash}_frame%04d.png" $i)
#		if [ -f "../train/data/${filename}" ]
#		then
#			continue
#		else
#			echo "error! file $filename doesn't exists"
#			exit
#		fi
#	done
#	eval "rm -r ../train/data/${hash}"
#
#done

#process masks
cat train.txt|while read hash
do 
#	if [ -f "../train/masks/$hash.png" ]
#	then
#		continue
#	else
#		echo "file $hash doesn't exist"
#		exit
#	fi
	for i in {0..99}
	do
		filename=$(printf "${hash}_frame%04d.png" $i)
		eval "cp ../train/masks/${hash}.png ../train/masks/${filename}"
	done
	eval "rm ../train/masks/${hash}.png"
done
a='
for i in {0..9}
do
	number=$(printf "frame%04d.png" $i)
	echo $number
done
'
