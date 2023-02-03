#!/bin/bash

DEBUG=''
SEED=0
while getopts "ds:" opt; do
  case $opt in
    d) DEBUG='-d'
    ;;
    s) SEED=$OPTARG
    ;;
  esac
done

for f in scripts/ontonotes_denoising_onoe/train*.sh;  do bash ${f} -s $SEED $DEBUG; done;