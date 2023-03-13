import argparse
import subprocess
# from ..stacks.run_deploy import deploy_stack

def get_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('--git_uri', type=str, help='GitHub URI')
    parser.add_argument('--git_branch', type=str, default='master', help='Git branch to checkout (default: main)')
    parser.add_argument('--module', type=str, choices=['tabular', 'multimodal', 'ts'], help='AutoGluon modules.')
    parser.add_argument('--mode', type=str, choices=['local', 'aws'], help='Where to run benchmark.')
    parser.add_argument('--data_path', type=str, help='Can be one of: dataset name, local path, S3 path, AMLB task ID/name')
    parser.add_argument('--benchmark_name', type=str, help='A unique name for the benchmark run.')
    parser.add_argument('--framework', choices=["AutoGluon", "AutoGluon_bestquality", "AutoGluon_hq", "AutoGluon_gq"], type=str, help='AMLB framework to evaluate')
    parser.add_argument('--benchmark', type=str, help='AMLB benchmark type.')
    parser.add_argument('--constraint', type=str, help='AMLB resource constraints.')
    parser.add_argument('--task', type=str, help='Task name. When OpenML is used, dataset name should be used.')


    args = parser.parse_args()
    return args
    

if __name__ == '__main__':
    args = get_args()
    
    if args.mode == "aws":
        raise NotImplementedError
        # deploy_stack()
        # TODO: invoke lambda to start the container jobs on AWS Batch
        # destroy_stack()
    elif args.mode == "local":
        print(args)
        # command = ["./run_benchmarks.sh", args.framework, args.benchmark, args.module, args.data_path, args.benchmark_name]
        command = ["./run_benchmarks.sh", args.git_uri, args.git_branch, args.module, args.data_path, args.benchmark_name]
        subprocess.run(command)
    else:
        raise NotImplementedError
