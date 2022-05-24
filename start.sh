_other_package () {
   if [[ $OTHER_PACKAGE != "None" ]]
   then
    apt-get install $OTHER_PACKAGE -y
   fi
   }
_other_pip () {
    if [[ $PIP_PACKAGE != "None" ]]
    then
      pip3 install $PIP_PACKAGE
    fi
    }

apt-get update -y && apt-get upgrade -y
git clone $REPO_URL repo
cd repo
apt-get install aria2 -y
wget $CONFIG_FILE_URL
wget $SA_ZIP_LINK
wget $TOCKEN_LINK
unzip accounts.zip
cp extract /usr/local/bin
cp pextract /usr/local/bin
chmod +x /usr/local/bin/extract && chmod +x ?usr/local/bin/pextract

locale-gen en_US.UTF-8

cp . .
cp .netrc /root/.netrc
chmod 600 /usr/src/app/.netrc
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat -O /usr/src/app/dht.dat && wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat -O /usr/src/app/dht6.dat
_other_package
_other_pip
pip3 install -r requirements.txt
pwd
ls -l
python3 -m bot
