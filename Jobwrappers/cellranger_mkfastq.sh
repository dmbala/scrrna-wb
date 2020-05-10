#!/bin/bash

# This script does a format conversion - BCL to FASTQ. 

BCL_DIR=$1
SAMPLE_FILE=$2
ID_NAME=$3
SCR_DIR=$4
OUT_DIR=$5 
num_cpus=$6 

BCL_NAME=$(echo $BCL_DIR | grep -Eo '[^/]+/?$' | cut -d / -f1 )


declare todaydir_name
assign_dirname () {
    dir_path="$1"
    cd $dir_path
    pwd
    today="$( date +"%Y%b%d" )"
    todaydir_name="$today$suffix"

    snumber=0
    while test -e "$todaydir_name"; do
        (( ++snumber ))
        suffix="$( printf -- '-%02d' "$snumber" )"
        todaydir_name="$today$suffix"
    done
    #dir_name="$today$suffix"
}
SCR_SUBDIR=$SCR_DIR"/"$BCL_NAME"/"
OUT_SUBDIR=$OUT_DIR"/"$BCL_NAME"/"

assign_dirname $OUT_SUBDIR
DATA_DIR=$OUT_DIR"/"$BCL_NAME"/"$todaydir_name
mkdir -p $DATA_DIR

assign_dirname $SCR_SUBDIR
JOB_DIR=$SCR_SUBDIR"/"$todaydir_name
mkdir -p $JOB_DIR

cd $JOB_DIR
cp $SAMPLE_FILE .

declare mkfastq_st=1
declare count_st=1
declare reanalyze_st=1

run_mkfastq () {
    echo " =================="
    echo "    CELLRANGER mkfastq "
    echo " =================="
    cellranger mkfastq --run $BCL_DIR --csv=$SAMPLE_FILE --id=$ID_NAME --maxjobs=$num_cpus --mempercore=8 
    if [ $? -eq 0 ]
    then
        echo "mkfastq successful"
        rsync -av --progress $JOB_DIR/$ID_NAME $DATA_DIR > rsync_mkfastq.out 2>&1 
        cp rsync_mkfastq.out $DATA_DIR/.
    fi
}
 

echo " =================="
echo "    BEGIN EXECUTION"
echo " =================="

run_mkfastq


echo "=================="
echo "    END EXECUTION"
echo "=================="

ls -lR $DATA_DIR > $BCL_NAME.filelists.txt 
cp $DATA_DIR/$BCL_NAME.filelists.txt .
rm -rf $JOB_DIR/*
cp $DATA_DIR/$BCL_NAME.filelists.txt $JOB_DIR/.

echo " =================="
echo " JOB DIRECTORY IS = $JOB_DIR" 
echo " DATA copied to = $DATA_DIR" 
echo " =================="

