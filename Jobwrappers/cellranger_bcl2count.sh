#!/bin/bash

# Runs anaylsis for a given input BCL data set. BCL is the raw format from 10X sequencer. Cell Ranger converts BCL to FASTQ format. The alignments are performed using STAR. Finally we will get quality metrics, count matrix, and cluster analysis. The results are available as summary in html file and loupe browser file. 


BCL_DIR=$1
SAMPLE_FILE=$2
SAMPLE_CHEM=$3
REF_GENOME=$4
ID_NAME=$5
SCR_DIR=$6
OUT_DIR=$7 
num_cpus=$8 
Total_mem=192
cpu_mem=8

BCL_NAME=$(echo $BCL_DIR | grep -Eo '[^/]+/?$' | cut -d / -f1 )
SAMPLE_NAMES=$(cat $SAMPLE_FILE | sed '1d' | cut -d "," -f2 | paste -sd "," -)

echo "===========JOB INPUT VARS========="
echo " BCL_DIR $BCL_DIR "
echo " SAMPLE_FILE $SAMPLE_FILE "
echo " SAMPLE_CHEM $SAMPLE_CHEM "
echo " REF_GENOME $REF_GENOME "
echo " ID_NAME $ID_NAME "
echo " SCR_DIR $SCR_DIR "
echo " OUT_DIR $OUT_DIR  "
echo " num_cpus $num_cpus  "
echo " Total_mem $Total_mem "
echo " cpu_mem $cpu_mem "
echo " BCL_NAME $BCL_NAME "
echo " SAMPLE_NAMES $SAMPLE_NAMES "
echo "=============================================================="


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
    cellranger mkfastq --run $BCL_DIR --csv=$SAMPLE_FILE --id=$ID_NAME --qc --jobmode=local --localcores=$num_cpus --localmem=$Total_mem 
    if [ $? -eq 0 ]
    then
        echo "mkfastq successful"
        rsync -av --progress $JOB_DIR/$ID_NAME $DATA_DIR --exclude '*.fastq.gz' > rsync_mkfastq.out 2>&1 
        cp rsync_mkfastq.out $DATA_DIR/.
    fi
}
 
run_count () {
    idCount="$ID_NAME-count"
    echo " =================="
    echo "    CELLRANGER count "
    echo " =================="
    cellranger count --fastqs=${PWD}/${ID_NAME}/outs/fastq_path/ --sample=$SAMPLE_NAMES --transcriptome=/projects/community/genomics_references/cellranger_ref//${REF_GENOME} --chemistry=$SAMPLE_CHEM --id=$idCount --jobmode=local --maxjobs=$num_cpus --localcores=$num_cpus --localmem=$Total_mem --mempercore=$cpu_mem
    if [ $? -eq 0 ]
    then
        echo "count successful"
        rsync -av --progress $JOB_DIR/$idCount $DATA_DIR --exclude '*.fastq.gz'  rsync_count.out 2>&1
        cp rsync_count.out $DATA_DIR/.
        count_st=0
    fi
}

run_reanalyze () {
idReanalyze="$ID_NAME-reanalyze"
    echo " =================="
    echo "    CELLRANGER reanalyze"
    echo " =================="
    cellranger reanalyze --matrix=${PWD}/${idCount}/outs/filtered_feature_bc_matrix.h5 --id=$idReanalyze
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

run_mkfastq
run_count
run_reanalyze


echo "=================="
echo "    END EXECUTION"
echo "=================="

ls -lR $DATA_DIR > $DATA_DIR/$BCL_NAME.filelists.txt 
cp $DATA_DIR/$BCL_NAME.filelists.txt .
rsync -av --progress $JOB_DIR/* $DATA_DIR --exclude '*.fastq.gz'
#rm -rf $JOB_DIR/*
cp $DATA_DIR/$BCL_NAME.filelists.txt $JOB_DIR/.

echo "=================="
echo "    Finished Copying Data to $DATA_DIR"
echo "=================="

echo " =================="
echo " JOB DIRECTORY IS = $JOB_DIR" 
echo " DATA copied to = $DATA_DIR" 
echo " =================="

