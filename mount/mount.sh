#!/bin/bash

set -f
set -e

BRANCH=up
HYBRIS_VERSION=hybris-commerce-suite-2105.10
PROJECT=mount


HYBRIS_FOLDER=/sqli/Hybris-suites
PROJECT_FOLDER=${PWD}
MERGE_ROOT_FOLDER=/work/$PROJECT


MERGE_FOLDER=$MERGE_ROOT_FOLDER/$BRANCH

HYBRIS_SUITE_FOLDER=$HYBRIS_FOLDER/$HYBRIS_VERSION
UPPER_FOLDER=$PROJECT_FOLDER/$BRANCH
TMP_WORKDIR=$PROJECT_FOLDER/tmp/$BRANCH

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -u|--umount)
    echo "-------> Unmount : $MERGE_FOLDER"
    sudo umount -v $MERGE_FOLDER
    echo "-------> End Unmount : $MERGE_FOLDER"
 
    exit 0
    ;;
    -h|--help)
     echo "  -u, --umount -> unmount volume"
	 echo "  -h, --help            -> display help"
	 exit 0
	;;

    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
	echo "UNKNOWN OPTIION $1"
	echo "  -h            -> display help"
	exit 1

    ;;
esac
done


if [ -d $TMP_WORKDIR ] 
then
    echo "skip create WORK DIRECTORY $TMP_WORKDIR" 
else
    mkdir -pv $TMP_WORKDIR
fi

if [ -d $MERGE_FOLDER ] 
then
    echo "skip create MERGE DIRECTORY $MERGE_FOLDER" 
else
    mkdir -pv $MERGE_FOLDER
fi

#:$HYBRIS_FOLDER/hybris-commerce-gigya

sudo mount -v -t overlay overlay -o lowerdir=$HYBRIS_SUITE_FOLDER,upperdir=$UPPER_FOLDER,workdir=$TMP_WORKDIR  $MERGE_FOLDER

echo "-------> Mount Folder : $MERGE_FOLDER"
