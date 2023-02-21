echo running jupyter/pyspark-notebook:latest
# ./build-docker-image.sh
docker run --name notebook -it --rm -p 8888:8888 -v ${PWD}/work:/home/jovyan/work bilgrami/start-ml:v1
