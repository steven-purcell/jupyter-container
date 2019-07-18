FROM ubuntu:latest

USER root

WORKDIR /home

# ffmpeg for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get install -y wget && \
    apt-get -y install python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Anaconda
#RUN wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh && \
#    bash Anaconda3-5.3.1-Linux-x86_64.sh
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
    'xlrd'
    # Activate ipywidgets extension in the environment that runs the notebook server
#    jupyter nbextension enable --py widgetsnbextension --sys-prefix

EXPOSE 8888

ENTRYPOINT jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root