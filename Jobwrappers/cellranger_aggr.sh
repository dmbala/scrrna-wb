#!/bin/bash

# Runs the aggregation on the results obtianed from the count analysis step. Each job creates a uniq directory based on the time step. 

NORM="none"

ID_NAME=$1
SAMPLE_FILE=$2
NORM=$3
SCR_DIR=$4
OUT_DIR=$5 
num_cpus=$6 

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
SCR_SUBDIR=$SCR_DIR"/"$ID_NAME"/"
OUT_SUBDIR=$OUT_DIR"/"$ID_NAME"/"

assign_dirname $OUT_SUBDIR
DATA_DIR=$OUT_DIR"/"$ID_NAME"/"$todaydir_name
mkdir -p $DATA_DIR

assign_dirname $SCR_SUBDIR
JOB_DIR=$SCR_SUBDIR"/"$todaydir_name
mkdir -p $JOB_DIR

cd $JOB_DIR
cp $SAMPLE_FILE .

run_aggr () {
    echo " =================="
    echo "    CELLRANGER aggr "
    echo " =================="
    cellranger aggr --id=$ID_NAME --csv=$SAMPLE_FILE --normalize=$NORM --maxjobs=$num_cpus --mempercore=8

    if [ $? -eq 0 ]
    then
        echo "mkfastq successful"
        rsync -av --progress $JOB_DIR/$ID_NAME $DATA_DIR --exclude '*.fastq.gz' > rsync_aggr.out 2>&1 
        cp rsync_aggr.out $DATA_DIR/.
    fi
}


run_reanalyze () {
    idReanalyze="$ID_NAME-reanalyze"
    echo " =================="
    echo "    CELLRANGER reanalyze"
    echo " =================="
    cellranger reanalyze --matrix=${PWD}/${ID_NAME}/outs/filtered_feature_bc_matrix.h5 --id=$idReanalyze
    if [ $? -eq 0 ]
    then
        echo "reanalyze successful"
        rsync -av --progress $JOB_DIR/$idReanalyze $DATA_DIR --exclude '*.fastq.gz'  rsync_reanalyze.out 2>&1
        cp rsync_reanalyze.out $DATA_DIR/.
        reanalyze_st=0
    fi
}


 

echo " =================="
echo "    BEGIN EXECUTION"
echo " =================="

run_aggr
run_reanalyze


echo "=================="
echo "    END EXECUTION"
echo "=================="

ls -lR $DATA_DIR > $JOB_DIR/filelists.txt 
rsync -av --progress $JOB_DIR/* $DATA_DIR --exclude '*.fastq.gz'
#rm -rf $JOB_DIR/*

echo "=================="
echo "    Finished Copying Data to $DATA_DIR"
echo "=================="

echo " =================="
echo " JOB DIRECTORY IS = $JOB_DIR" 
echo " DATA copied to = $DATA_DIR" 
echo " =================="

