TAGNAME=tzsample
IMAGENAME=tzsample
CONTAINERNAME=tzcontainer

all:clean build/success run
failure:clean build/failure run
	
build/success:
	docker build -t ${IMAGENAME}:${TAGNAME} -f Dockerfile.success .

build/failure:
	docker build -t ${IMAGENAME}:${TAGNAME} -f Dockerfile.failure .

run:
	docker run --name ${CONTAINERNAME} ${IMAGENAME}:${TAGNAME}

clean:
	(docker ps --all --filter name=${CONTAINERNAME} | grep -v CONTAINER | cut -c1-13 | xargs docker kill) | true
	(docker ps --all --filter name=${CONTAINERNAME} | grep -v CONTAINER | cut -c1-13 | xargs docker rm) | true
	docker volume prune -f
