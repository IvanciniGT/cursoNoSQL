docker run -it --rm -p 8081:8888 \
    -v /home/ubuntu/environment/curso:/home/jovyan/work \
    jupyter/datascience-notebook:latest

# Abrir un navegador y escribir http://localhost:8081