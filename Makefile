TAGNAME=tzsample
IMAGENAME=tzsample
CONTAINERNAME=tzcontainer

all:clean build run
	
build:
	docker build -t ${IMAGENAME}:${TAGNAME} .

run:
	docker run --name ${CONTAINERNAME} ${IMAGENAME}:${TAGNAME}

clean:
	(docker ps --all --filter name=${CONTAINERNAME} | grep -v CONTAINER | cut -c1-13 | xargs docker kill) | true
	(docker ps --all --filter name=${CONTAINERNAME} | grep -v CONTAINER | cut -c1-13 | xargs docker rm) | true
	docker volume prune -f
