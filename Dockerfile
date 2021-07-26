  
FROM python:3.8.2-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

# Install Ubuntu dependencies
# libopencv-dev = opencv dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        libopencv-dev \ 
        build-essential \
        libssl-dev \
        libpq-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        gettext \
        unzip \
        supervisor \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        python3-urllib3 \
        cpulimit \
        screen \
        wget \
        tar \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade PIP
RUN pip install pip pipenv --upgrade

# sklearn opencv, numpy, and pandas
RUN pip install scikit-learn opencv-contrib-python numpy pandas

# tensorflow (including Keras)
RUN pip install tensorflow keras


CMD ["./scripts/entrypoint.sh"]
