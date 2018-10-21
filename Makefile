IMAGE=yuzushio/chainer-cupy-cuda90-mnist
CONTAINER=cccm
MEMORY=16g
HOSTDIR=${PWD}/testfiles/
GUESTDIR=/workspace/

build:
	docker build -t $(IMAGE) .

run:
	docker run \
	-it \
	--runtime=nvidia \
	--name $(CONTAINER) \
	-m $(MEMORY) \
	-v $(HOSTDIR):$(GUESTDIR) \
	$(IMAGE) \
	/bin/bash

traintest:
	docker run \
	-it \
	--runtime=nvidia \
	--name $(CONTAINER) \
	-m $(MEMORY) \
	-v $(HOSTDIR):$(GUESTDIR) \
	$(IMAGE)

stop:
	docker stop $(CONTAINER)

rm:
	docker rm $(CONTAINER)

destroy: stop rm

rs: destroy run

ps:
	docker ps -a

clean:
	docker rm `docker ps -aq`

il:
	docker images

rmi:
	docker rmi -f $(IMAGE)
