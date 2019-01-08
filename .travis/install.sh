#!/bin/bash
set -e

# source ~/.nvm/nvm.sh
# nvm install v8.10.0

sudo apt-get install python3-apt
pip install --user --ignore-installed setuptools
pip install --user urllib3 pyOpenSSL ndg-httpsclient pyasn1
pip install --user python-coveralls

python $TRAVIS_BUILD_DIR/.travis/install.py --develop --user travis --without-bench-setup
pip install --user -e ~/bench

rm $TRAVIS_BUILD_DIR/.git/shallow
cd ~/ && bench init frappe-bench --python $(which python) --frappe-path $TRAVIS_BUILD_DIR
cp -r $TRAVIS_BUILD_DIR/test_sites/test_site ~/frappe-bench/sites/
cp -r $TRAVIS_BUILD_DIR/test_sites/test_site_postgres ~/frappe-bench/sites/
cp -r $TRAVIS_BUILD_DIR/test_sites/test_site_ui ~/frappe-bench/sites/