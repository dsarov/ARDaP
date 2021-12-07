FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

### RUN set -ex; \

RUN apt-get update -qq; \
    apt-get install -y -qq git \
    apt-utils \
    wget \
    python3-pip \
    ncbi-blast+ \
    libz-dev \
    ; \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*;

ENV DEBIAN_FRONTEND Teletype

# Install python dependencies
RUN pip3 install -U biopython==1.73 tabulate cgecore gitpython python-dateutil;

# RESFINDER setup
COPY run_resfinder.py /usr/src/run_resfinder.py

ADD cge /usr/src/cge
ADD tests /usr/src/tests

# Install kma
RUN cd /usr/src/cge; \
    git clone --depth 1 https://bitbucket.org/genomicepidemiology/kma.git; \
    cd kma && make; \
    mv kma* /bin/


RUN chmod 755 /usr/src/run_resfinder.py
RUN chmod 755 /usr/src/tests/functional_tests.py


ENV PATH $PATH:/usr/src
# Setup .bashrc file for convenience during debugging
RUN echo "alias ls='ls -h --color=tty'\n"\
"alias ll='ls -lrt'\n"\
"alias l='less'\n"\
"alias du='du -hP --max-depth=1'\n"\
"alias cwd='readlink -f .'\n"\
"PATH=$PATH\n">> ~/.bashrc


# Change working directory
WORKDIR "/usr/src/"

# Execute program when running the container
ENTRYPOINT ["python3", "/usr/src/run_resfinder.py"]