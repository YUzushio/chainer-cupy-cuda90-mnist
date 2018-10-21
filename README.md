# chainer-gpu-cupy-cuda90-mnist

## NVIDIA-Docker image for chainer mnist with gpu computong with Python 3.5.2

- Notice: tensorflow-gpu is available!!
- Warning: jupyter notebook is NOT available.
- Warning: This Dockerfile use auto installation
  - This distoribution made at 2018.10.21
  - If you build from Dockerfile, the versions will be change.

## Installed distribution, tool & package versions

- OS: Ubuntu 16.04.5 LTS (Xenial Xerus)
- CUDA: 9.0.176
- cudnn: 7.3.1
- Python: 3.5.1
- pip: 18.1
- tensorflow-gpu: 1.11.0
- cupy-cuda90(cupy alternative): 4.5.0
- chaienr: 4.5.0

## Development host Envirinmenet (For info, it's not prerequrests)

- OS: Ubuntu 18.04.1 LTS (Bionic Beaver)
- NVIDIA Driver: 410.48
- CUDA: 9.0.176
- Docker: 18.06.1
- NVIDIA-Docker: 2.0.3

## How to use (with Makefile)
 If you see this README from outside GitHub, see here https://github.com/YUzushio/chainer-gpu-cupy-cuda90-mnist.git
 
#### Clone source
  `git clone https://github.com/YUzushio/chainer-gpu-cupy-cuda90-mnist.git`

#### Go to directory
  `cd chainer-gpu-cupy-cuda90-mnist`

#### Build
  `make build`

#### Run
  `make run`

#### Excute MNIST training
  `make traintest`
