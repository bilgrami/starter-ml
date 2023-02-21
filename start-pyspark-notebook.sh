echo running jupyter/pyspark-notebook:latest
docker run --name notebook -it --rm \
    -p 8888:8888 \
    -v work:/home/jovyan/work \
    bilgrami/start-ml:v1

# run this in another window to copy notebooks
# docker cp ${PWD}/work/ notebook:/home/jovyan/work/
