FROM debian:buster
LABEL maintainer="Kowalski Dark <darkkowalski2012@gmail.com>"

# Debug: TUNA mirror
# COPY ./debug/sources.list /etc/apt/sources.list

# install dependencies for idf
RUN apt update && \
    apt install -y vim git wget curl libncurses-dev flex bison \
        gperf python python-click python-pip python-setuptools \
        python-serial python-cryptography python-future \
        python-pyparsing python-pyelftools cmake ninja-build \
        ccache libffi-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# install pre-built cross-compile tools: gcc 8.2 and binutils
# install idf v4.0
COPY  ./esp /esp
RUN python -m pip install --user -r /esp/esp-idf/requirements.txt

COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT [ "/root/entrypoint.sh" ]