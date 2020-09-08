#!/bin/sh

input_folder="./Outputs/Batch/imgs/"
input_bw_folder="./Outputs/Batch/imgs_bw/"
output_folder="./Outputs/Batch/output_final/"
files=`ls $input_folder` 

i=0
for file in $files
do
	i=$((i+1))
	echo $i $file

	output1=$(python -W ignore 1_default_colorization.py "$input_folder$file" "./Outputs/Batch/output_intermediate/$file")
	output2=$(python -W ignore 2_get_coordinates.py $output1 2 16)
	python -W ignore 3_interactive_coloring.py "$input_bw_folder$file" "./Outputs/Batch/output_intermediate/$file" $output2 "$output_folder$file"
done