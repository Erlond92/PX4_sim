FROM px4io/px4-dev:v1.17.0-beta1

RUN apt-get update && apt-get install -y \
    git \
    python3-empy \
    python3-toml \
    python3-numpy \
    python3-jinja2 \
    python3-yaml \
    python3-packaging \
    python3-pip \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone --recursive https://github.com/PX4/PX4-Autopilot.git

WORKDIR /root/PX4-Autopilot
RUN bash ./Tools/setup/ubuntu.sh
RUN make px4_sitl_default

CMD ["bash", "-c", "HEADLESS=1 make px4_sitl gz_x500_vision"]
