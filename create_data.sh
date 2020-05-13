#!/bin/sh

for year in "$@"
do	
	filename="MICRODADOS_ENEM"
	columns='1-3,83-110'
	delimite=";"

	if [ $year = 2016 ]
	then
		filename="microdados_enem"

		columns='1-3,89-116'
	fi
	
	if [ $year = 2014 ]
	then
		columns='1-3,63-90'
		delimeter=","
	fi

	if [ $year = 2015 ]
	then
		columns='1-3,89-116'
		delimeter=","
	fi

	echo $columns

	cat "raw_data/"$filename"_"$year".csv" \
		| cut -d"$delimeter" -f$columns \
		| awk -F"$delimeter" 'BEGIN{OFS=","} {$1=$1; if (NR==1 || $4$5$6$7==1111) print}' \
		> parsed_data/only_answers_$year.csv
done
