ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/pyspark-notebook:latest
FROM $BASE_CONTAINER

LABEL maintainer="Syed A Bilgrami <bilgrami@gmail.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN pip install jupyterlab-git
RUN conda install -c conda-forge jupyterlab-git
RUN pip install jupyter_scheduler
RUN pip install delta-spark

# WORKDIR /home/jovyan/work
EXPOSE 8888
# give permission to default notebook user jovyan
RUN chown -R 1000 /home/jovyan/
