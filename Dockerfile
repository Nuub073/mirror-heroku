FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update -y && apt-get upgrade -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y tzdata wget unzip git python3 python3-pip \
    locales python3-lxml \
    curl pv jq ffmpeg \
    p7zip-full p7zip-rar \
    libcrypto++-dev libssl-dev \
    libc-ares-dev libcurl4-openssl-dev \
    libsqlite3-dev libsodium-dev

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]