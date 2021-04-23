#!/usr/bin/bash
#extract from dir
cat test.txt|while read hash
do
	for i in {0..99}
	do
		filename=$(printf "frame%04d.png" $i)
		eval "cp ../test/data/${hash}/${filename} ../my_dataset/img_dir/test/${hash}_${filename}"
	done

done
