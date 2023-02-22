# Machine Learning Starter Toolchain 
## Docker based Jupyter Notebook with support for Delta tables

This repo contains docker based Jupyter notebook with added support of
- Jar packages for Delta Table (delta.io)
- jupyterlab-git extension

Please read below for additional details about source Jupyter notebooks

https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html

---

# Getting Started

## Pre-requisites
### Docker
This requires Docker to be installed on your machine 

[📖 Installation Guide](https://docs.docker.com/get-docker/#supported-platforms).


## Start the notebook
```bash
dos2unix ./start-notebook.sh;
chmod +x ./start-notebook.sh;
./start-notebook.sh;
```
---

## Connect with the notebook via terminal

```
# connect with the terminal
docker exec -it notebook /bin/bash
```

## Stop the notebook
```bash
chmod +x ./stop-notebook.sh
./stop-notebook.sh
```

## Remove the notebook permanently

```bash
chmod +x ./remove-notebook.sh
./remove-notebook.sh
```

## get the random host port assigned to the container port 8888
```bash
docker port notebook 8888
```
## get the notebook token from the logs
```bash
docker logs --tail 3 notebook
```

---

## Test Notebooks

Following test notebooks are available

- ./hello.ipynb
- ./hello-delta.ipynb

### Starter code for Delta table

```python
import os
os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages io.delta:delta-core_2.12:2.2.0 --conf spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension --conf spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog pyspark-shell'
### import Spark libraries
from pyspark.sql import SparkSession
import pyspark.sql.functions as F
from delta import *

### spark package maven coordinates - in case you are loading more than just delta
spark_packages_list = [
    'io.delta:delta-core_2.12:2.2.0',
]
spark_packages = ",".join(spark_packages_list)

### SparkSession 
spark = (
    SparkSession.builder
    .config("spark.jars.packages", spark_packages)
    .config("spark.delta.logStore.class", "org.apache.spark.sql.delta.storage.S3SingleDriverLogStore")
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
    .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") 
    .getOrCreate()
)

sc = spark.sparkContext

### Python library in delta jar. 
### Must create sparkSession before import
from delta.tables import *

# Create a table
# To create a Delta table, write a DataFrame out in the delta format. You can use existing Spark SQL code and change the format from parquet, csv, json, and so on, to delta.

data = spark.range(0, 5)
data.write.format("delta").save("/tmp/delta-table")

# Read data 
# You read data in your Delta table by specifying the path to the files "/tmp/delta-table":
df = spark.read.format("delta").load("/tmp/delta-table")
df.show()

```

---
<br>

# Contribution
- Pull requests are encouraged and always welcome.
- Email me at: bilgrami at giiii male punto com
