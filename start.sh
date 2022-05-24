apt-get update -y && apt-get upgrade -y
git clone $REPO_URL repo
cd repo
apt-get install aria2 -y
wget $CONFIG_FILE_URL
wget $SA_ZIP_LINK
wget $TOCKEN_LINK
unzip accounts.zip
cp extract /usr/local/bin
chmod +x /usr/local/bin/extract
apt-get -qq purge git
locale-gen en_US.UTF-8
cp netrc /root/.netrc
chmod +x aria.sh
pip3 install -U -r requirements.txt
pwd
ls -l
python3 -m bot
