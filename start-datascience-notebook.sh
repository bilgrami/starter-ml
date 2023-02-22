echo running jupyter/datascience-notebook:latest
docker run --name notebook -it --rm -p 8888:8888 -v "${PWD}/work":/home/jovyan/work jupyter/datascience-notebook:latest
