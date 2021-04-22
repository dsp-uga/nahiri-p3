#!/usr/bin/bash

#gsutil -m cp -r gs://uga-dsp/project3/data/* ../train/data/

cat train.txt|while read hash
do
	#echo $hash
	if [ -d "../train/data/${hash}/" ]
	then
		eval "rm -r ../train/data/${hash}/* "
	else
		eval "mkdir ../train/data/$hash/"
	fi
	eval "tar -xvf ../train/data/$hash.tar -C ../train/data/$hash/ > /dev/null"
done

cat train.txt|while read hash
do
	#echo $hash
	eval "mv ../train/data/${hash}/data/${hash}/* ../train/data/${hash}/"
	eval "rm -r ../train/data/${hash}/data"
done

mkdir ../test/data/
cat test.txt|while read hash
do
	eval "mv ../train/data/${hash}.tar ../test/data/"
	if [ -d "../test/data/$hash" ]
	then
		eval "rm -r ../test/data/${hash}/*"
	else
		eval "mkdir ../test/data/$hash"
	fi

	eval "tar -xvf ../test/data/$hash.tar -C ../test/data/$hash/ > /dev/null"
	eval "mv ../test/data/${hash}/data/${hash}/* ../test/data/${hash}/"
	eval "rm -r ../test/data/${hash}/data"
done
