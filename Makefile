IMAGE=yuzushio/chainer-cupy-cuda90-mnist
CONTAINER=cccm
MEMORY=16g
HOSTDIR=${PWD}/files/
GUESTDIR=/workspace/
CUDA_LIB=-v /usr/local/cuda/lib64:/usr/local/cuda/lib64
CUDA_SO=-v /usr/lib/x86_64-linux-gnu/libcuda.so:/usr/lib/x86_64-linux-gnu/libcuda.so -v /usr/lib/x86_64-linux-gnu/libcuda.so.1:/usr/lib/x86_64-linux-gnu/libcuda.so.1 -v /usr/lib/x86_64-linux-gnu/libcuda.so.410.48:/usr/lib/x86_64-linux-gnu/libcuda.so.410.48
DEVICES=--device /dev/nvidia-modeset:/dev/nvidia-modeset --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl

build:
	docker build -t $(IMAGE) .

run:
	docker run \
	-it \
	--runtime=nvidia \
	--name $(CONTAINER) \
	-m $(MEMORY) \
	-v $(HOSTDIR):$(GUESTDIR) \
	$(IMAGE)

bash:
	docker run \
	-it \
	--runtime=nvidia \
	--name $(CONTAINER) \
	-m $(MEMORY) \
	-v $(HOSTDIR):$(GUESTDIR) \
	$(IMAGE) \
	/bin/bash

stop:
	docker stop $(CONTAINER)

delete:
	docker rm $(CONTAINER)

halt: stop delete

rt: stop delete test

rs: stop delete run

ps:
	docker ps -a

clean:
	docker rm `docker ps -aq`

il:
	docker images

rmi:
	docker rmi -f $(IMAGE)
