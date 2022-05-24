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
apt-get -qq install aria2 -y
wget $CONFIG_FILE_URL
wget $SA_ZIP_LINK
wget $TOCKEN_LINK
wget $AUTH_CHAT_LINK
unzip accounts.zip

cp requirements.txt .
cp extract /usr/local/bin
chmod +x /usr/local/bin/extract
pip3 install --no-cache-dir -r requirements.txt && apt-get -qq purge git


cp . .
cp netrc /root/.netrc
chmod +x aria.sh
_other_package
_other_pip
pwd
ls -l
python3 setup.py
