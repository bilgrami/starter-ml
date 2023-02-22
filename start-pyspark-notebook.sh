echo running jupyter/pyspark-notebook:latest
docker run --name notebook -it --rm \
    -p 8888:8888 \
    -v `pwd`/work:/home/jovyan/work \
    -e GRANT_SUDO=yes \
    bilgrami/start-ml:v1
