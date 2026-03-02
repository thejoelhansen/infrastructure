#!/bin/bash

# Functions


# Source the build log

# Check if machine_env is set 
if [[ -z "$machine_env" ]]; then
    echo "Warning: machine_env is not set. Using 'default'."
    env_key="default"
else
    env_key="${machine_env,,}"  # lowercase
fi

# Get PWD directory 
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# !!! Add HERE whenever new nodes enter the cluster
# Map keys to build log files 
declare -A build_logs=(
    [default]="$script_dir/default-build.yaml"
    [laptop]="$script_dir/laptop-build.yaml"
    [workstation]="$script_dir/workstation-build.yaml"
    [fileserver]="$script_dir/fileserver-build.yaml"
)

# Set build_log based on machine_env
build_log="${build_logs[$env_key]:-${build_logs[default]}}"
export build_log

# Quick alias for immediate use
alias build-log="vim \"$build_log\""

# Persistent alias
bashrc="$HOME/.bashrc"

# Check if ~/.bashrc already contains 'build-log'
if ! grep -q 'alias build-log=' "$bashrc"; then
    echo "Adding 'build-log' alias to $bashrc"
    echo "alias build-log='nano \"$build_log\"'" >> "$bashrc"
fi

# Print for verification
echo "machine_env='$env_key', build_log='$build_log'"
echo "build-log alias is ready to use"
