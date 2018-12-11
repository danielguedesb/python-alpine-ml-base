FROM continuumio/miniconda3:4.5.11

COPY environment.yml environment.yml

RUN conda config --add channels conda-forge \
    && conda env update -f=environment.yml \
    && rm -rf /opt/conda/pkgs/*

RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
ENV PATH /opt/conda/envs/base/bin:$PATH

RUN echo $PATH
RUN conda env list

ENTRYPOINT ls