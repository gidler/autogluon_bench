#!/bin/bash

# # Default values
# git_uri="https://github.com/autogluon/autogluon.git"
# git_branch="master"
# module="multimodal"
# data_path="MNIST"
# benchmark_name="test"
# framework="AutoGluon:latest"
# benchmark="test"
# constraint="test"
# task="iris"


# # Parse command-line options using getopts
# while getopts ":gu:gb:m:d:bn:f:b:c:t" opt; do
#   case $opt in
#     gu) git_uri="$OPTARG"
#     ;;
#     gb) git_branch="$OPTARG"
#     ;;
#     m) module="$OPTARG"
#     ;;
#     d) data_path="$OPTARG"
#     ;;
#     bn) benchmark_name="$OPTARG"
#     ;;
#     f) framework="$OPTARG"
#     ;;
#     b) benchmark="$OPTARG"
#     ;;
#     c) constraint="$OPTARG"
#     ;;
#     t) task="$OPTARG"
#     ;;

#     \?) echo "Invalid option -$OPTARG" >&2
#     ;;
#   esac
# done

# shift $((OPTIND-1))

# echo '~~~~~~~~'
# echo $task


GIT_URI=${1:-"https://github.com/autogluon/autogluon.git"}
BRANCH=${2:-"master"}
MODULE=${3:-"multimodal"}
DATA_PATH=${4:-"MNIST"}
BENCHMARK_NAME=${5:-"bench_test_local"}

if [ "$MODULE" = "multimodal" ]; then
  python ./run_benchmarks.py \
    --git_uri $GIT_URI \
    --git_branch $BRANCH \
    --module $MODULE \
    --data_path $DATA_PATH\
    --benchmark_name $BENCHMARK_NAME 
elif [ "$MODULE" = "tabular" ]; then
  python ./run_benchmarks.py \
    --module $MODULE \
    --data_path $DATA_PATH\
    --benchmark_name $BENCHMARK_NAME 
else
    echo "Invalid module type: $MODULE"
fi