
JOB_DIR=$1
DATA_DIR=$2
exclude=$3

if [ $? -eq 0 ]
then
    echo "Loal Transfer includes FASTQ files "
    rsync -av --progress $JOB_DIR $DATA_DIR  > rsync_status.out 2>&1
fi

if [ $? -eq 1 ]
then
    echo "Loal Transfer excludes FASTQ files "
    rsync -av --progress $JOB_DIR $DATA_DIR --exclude '*.fastq.gz' > rsync_status.out 2>&1
fi


