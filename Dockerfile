FROM iamliquidx/mirleechxsdk:a8ce33bccdde0806fbd0541d5faf33e63a572582

RUN apt-get update -y && apt-get upgrade -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y tzdata wget unzip git python3 python3-pip \
    locales python3-lxml \
    curl pv jq ffmpeg \
    p7zip-full p7zip-rar \
    libcrypto++-dev libssl-dev \
    libc-ares-dev libcurl4-openssl-dev \
    libsqlite3-dev libsodium-dev && \
    curl -L https://github.com/lzzy12/megasdkrest/releases/download/v0.1.14-rebuild/megasdkrest-$(cpu=$(uname -m); if [[ "$cpu" == "x86_64" ]]; then    echo "amd64"; elif [[ "$cpu" == "x86" ]]; then    echo "i386"; elif [[ "$cpu" == "aarch64" ]]; then    echo "arm64"; else    echo $cpu; fi) -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]