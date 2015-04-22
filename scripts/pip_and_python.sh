# Install Pip
sudo apt-get install -y libxml2-dev libxslt-dev lib32z1-dev zlib1g-dev python-dev python3-pip
mkdir -p ~/.pip/cache
echo '[global]' > ~/.pip/pip.conf
echo 'download_cache = ~/.pip/cache' >> ~/.pip/pip.conf

# Install PyVEnv and activate environment
# See http://askubuntu.com/a/488530/41401
cd /vagrant
pyvenv-3.4 --without-pip v_env34
source ./v_env34/bin/activate
wget https://pypi.python.org/packages/source/s/setuptools/setuptools-3.4.4.tar.gz
tar -vzxf setuptools-3.4.4.tar.gz
cd setuptools-3.4.4
python setup.py install
cd ..
rm setuptools-3.4.4.tar.gz
sudo rm -R setuptools-3.4.4
wget https://pypi.python.org/packages/source/p/pip/pip-1.5.6.tar.gz
tar -vzxf pip-1.5.6.tar.gz
cd pip-1.5.6
python setup.py install
cd ..
rm pip-1.5.6.tar.gz
sudo rm -R pip-1.5.6
deactivate
source v_env34/bin/activate
pip install -Ur requirements_py34.txt
pip freeze > requirements_py34.txt
sudo touch /home/vagrant/.bash_profile
sudo echo 'cd /vagrant ; source v_env34/bin/activate' >> /home/vagrant/.bash_profile