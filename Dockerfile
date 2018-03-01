FROM phusion/baseimage:0.10.0

ENV NUM_THREADS 2

RUN apt-get update && apt-get dist-upgrade -yf && apt-get clean && apt-get autoremove
RUN apt-get install -y \
    build-essential \
    cmake \
    git \
    libasound2-dev \
    libboost-all-dev \
    libfftw3-3 \
    libfftw3-dev \
    libqwt-dev \
    libqwt5-qt4 \
    libusb-1.0-0 \
    libusb-1.0-0-dev \
    libzmq3-dev \
    libuhd-dev \
    libuhd003 \
    libcppunit-dev \
    uhd-host \
    pkg-config \
    python-cairo-dev \
    python-cheetah \
    python-gtk2 \
    python-lxml \
    python-mako \
    python-numpy \
    python-qt4 \
    python-qwt5-qt4 \
    python-pip \
    python-zmq \
    swig

RUN git clone --recursive https://github.com/gnuradio/gnuradio.git && \
    cd gnuradio && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make

RUN git clone https://github.com/mossmann/hackrf.git && \
    cd hackrf && \
    mkdir host/build && \
    cd host/build && \
    cmake .. && \
    make && \
    make install && \
    ldconfig

RUN git clone git://git.osmocom.org/gr-osmosdr && \
    cd gr-osmosdr && \
    mkdir build && \
    cd build && \
    cmake ../ -DENABLE_HACKRF=ON && \
    make -j${NUM_THREADS} && \
    make install && \
    ldconfig

CMD ["/bin/bash"]
