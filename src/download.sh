#!/bin/sh

# Download URL to update to a new version
DOWNLOAD_URL=https://github.com/ronggang/transmission-web-control/archive/refs/tags/v1.6.1-update1.zip

# Clean up Before
echo "Clean up Before ..."
rm -R transmission_web_control

# Download Zip file
echo "Download Zip file ..."
wget $DOWNLOAD_URL -O download.zip

# Unzip Zip file
echo "Unzip Zip file ..."
unzip download.zip

# Move Sources files
echo "Move Sources files ..."
mv transmission-web-control-*/src transmission_web_control

# Clean up After
echo "Clean up After ..."
rm download.zip
rm -R transmission-web-control-*

echo "Complete !"

exit 0
