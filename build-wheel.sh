#!/usr/bin/env bash
set -euo pipefail

export CUDA_HOME="${CUDA_HOME:-/usr/local/cuda-12.8}"
export PATH="$CUDA_HOME/bin:${PATH}"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST:-7.5 8.0 8.6 9.0}"
export CUDACXX="${CUDACXX:-$CUDA_HOME/bin/nvcc}"
export CMAKE_ARGS="${CMAKE_ARGS:-} -DCMAKE_CUDA_COMPILER=$CUDACXX -DCUDAToolkit_ROOT=$CUDA_HOME"

python -m build --wheel --no-isolation
