# starter-ml
Machine Learning Starter Toolchain
<br>

# Prerequisites
## Docker
This requires Docker to be installed on your machine [📖 Installation Guide](https://docs.docker.com/get-docker/#supported-platforms).

---


# Start the notebook
```bash
dos2unix ./start-notebook.sh;
chmod +x ./start-notebook.sh;
./start-notebook.sh;
```
---
Note: To choose a different start stack, visit 

https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html

## Test Notebooks

Test notebooks are under "./work" folder 

- ./work/hello.ipynb
- ./work/hello-delta.ipynb

<br/>

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
---

## Misc Helper commands
### get the random host port assigned to the container port 8888
```bash
docker port notebook 8888
```
### get the notebook token from the logs
```bash
docker logs --tail 3 notebook
```

<br>

# Contribution
- Pull requests are encouraged and always welcome.
- Email me at: bilgrami at giiii male punto com
