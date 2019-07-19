FROM ubuntu:latest

USER root

WORKDIR /home

# ffmpeg for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get install -y wget && \
    apt-get -y install python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Jupyter
RUN pip3 install --upgrade pip
RUN pip3 install jupyter

# Install Python 3 packages
RUN pip3 install \
    'ipywidgets' \
    'pandas' \
    'numexpr' \
    'matplotlib' \
    'scipy' \
    'seaborn' \
    'scikit-learn' \
    'scikit-image' \
    'sympy' \
    'cython' \
    'patsy' \
    'statsmodels' \
    'cloudpickle' \
    'dill' \
    'dask' \
    'numba' \
    'bokeh' \
    'sqlalchemy' \
    'h5py' \
    'vincent' \
    'protobuf' \
    'xlrd' \
    'tensorflow' \
    'setuptools>=41.0.0' \
    'pandas-profiling'

EXPOSE 8888

ENTRYPOINT jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password='' --no-browser