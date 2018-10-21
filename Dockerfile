FROM nvidia/cuda:9.0-cudnn7-runtime
MAINTAINER YUzushio byr.wgp.jg.cg.1229+yuzushio@gmail.com

# gcc and g++ is nessesary to excute chainer mnist
# install python3 (3.6.3)
RUN apt update && apt install -y curl wget vim git \
  libnvtoolsext1 \
  libgomp1 \
  gcc \
  g++ \
  python3
# install pip
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3

# install cupy as cupy-cuda90
RUN pip install tensorflow-gpu keras matplotlib cupy-cuda90 chainer chainerui

WORKDIR /repository
RUN git clone https://github.com/chainer/chainer.git

# export cuda library path
ENV LD_LIBRARY_PATH /usr/local/cuda:/usr/local/nvidia/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/nvidia/lib

CMD python3 /repository/chainer/examples/mnist/train_mnist.py
