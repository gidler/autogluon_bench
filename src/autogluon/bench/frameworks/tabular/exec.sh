#!/bin/bash

framework=${1:-"AutoGluon:latest"}
benchmark=${2:-"test"}
constraint=${3:-"test"}
DIR=${4:-"./benchmark_runs/tabular/test"}  # from root of project

cd $DIR
python ./automlbenchmark/runbenchmark.py $framework $benchmark $constraint -s force
