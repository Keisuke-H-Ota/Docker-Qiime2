FROM continuumio/miniconda3:4.10.3-alpine

RUN conda update -y conda
RUN	conda install -y wget
RUN	wget https://data.qiime2.org/distro/core/qiime2-2021.8-py38-linux-conda.yml
RUN	conda env create -n qiime2-2021.8 --file qiime2-2021.8-py38-linux-conda.yml
RUN rm qiime2-2021.8-py38-linux-conda.yml