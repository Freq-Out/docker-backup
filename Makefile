CONTAINER_NAME=freqout/backup

build: Dockerfile
	docker build -t ${CONTAINER_NAME} .

