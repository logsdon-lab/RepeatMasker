FROM ubuntu:22.04

# Template from: https://github.com/jmonlong/docker-repeatmasker/blob/master/Dockerfile

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        unzip \
        gcc \ 
        build-essential \
        python3 \
        python3-pip \
        make && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install h5py

WORKDIR /usr/local/bin

# Get trf and wget
RUN wget https://github.com/Benson-Genomics-Lab/TRF/releases/download/v4.09.1/trf409.linux64 && \
    mv trf409.linux64 trf && \
    chmod +x trf

RUN wget https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-linux.tar.gz && \
    tar -zxvf rmblast-2.14.1+-x64-linux.tar.gz && \
    rm -f rmblast-2.14.1+-x64-linux.tar.gz

WORKDIR /usr/local/RepeatMasker

RUN mkdir Libraries
RUN wget -O Dfam_curatedonly.h5.gz https://www.dfam.org/releases/Dfam_3.7/families/Dfam_curatedonly.h5.gz && \
    gunzip -c Dfam_curatedonly.h5.gz > Libraries/Dfam.h5 && \
    rm Dfam_curatedonly.h5.gz

# Copy new code.
COPY . .

# Configure.
RUN perl ./configure \
    -libdir=/usr/local/RepeatMasker/Libraries \
    -trf_prgm=/usr/local/bin/trf \
    -default_search_engine=rmblast \
    -rmblast_dir=/usr/local/bin/rmblast-2.14.1/bin

RUN cpan Text::Soundex

ENV PATH=/usr/local/RepeatMasker:$PATH

WORKDIR /home
