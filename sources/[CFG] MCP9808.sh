# Set initial configuration for using MPC9808 temperature sensor with Python

# GENERAL INFORMATION #########################################################
# MCP9808 product:    https://www.adafruit.com/product/1782
# MCP9808 datasheet:  http://www.microchip.com/wwwproducts/en/en556182
# Adafruit ref page:  https://learn.adafruit.com/mcp9808-temperature-sensor-python-library
#


# STEP 1 ######################################################################
# Hardware layout
# Connect MCP9808 Gnd to Pi Gnd  (pin 6)
# Connect MCP9808 Vdd to Pi 3.3V (pin 1)
# Connect MCP9808 SCL to Pi SCL  (pin 5)
# Connect MCP9808 SDA to Pi SDA  (pin 3)
#


# STEP 2 ######################################################################
# Make sure I²C is enabled
# https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup
# or PDF "[3] Adafruit's Raspberry Pi Lesson 4. GPIO Setup"
# Update packages
sudo apt-get update
# Install Python development toolkit
sudo apt-get install python-dev
# Install GPIO port Python library
sudo apt-get install python-rpi.gpio
# Install I²C utilities
sudo apt-get install -y python-smbus
sudo apt-get install -y i2c-tools

# Install Kernel support for I²C (Graphical way)
sudo raspi-config
# Enter the "5 Interfacing Options" menu, then "I2C" and enable

# Install Kernel support for I²C (CLI way)
# Add "i2c-bcm2708" and "i2c-dev" in two separate lines at the end of file
sudo nano /etc/modules
# Comment out "blacklist spi-bcm2708" and "blacklist i2c-bcm2708" from this file
sudo nano /etc/modprobe.d/raspi-blacklist.conf
# Add "dtparam=i2c1=on" and "dtparam=i2c_arm=on" at the end of this file
sudo nano /boot/config.txt
# Reboot
sudo reboot

# When restarted, test I²C. Some numbers should appear in place of "--"
sudo i2cdetect -y 1


# STEP 3 ######################################################################
# Install dependencies
# https://learn.adafruit.com/mcp9808-temperature-sensor-python-library 
# or PDF "[1] MCP9808 Temperature Sensor Python Library"
#
sudo apt-get install build-essential python-dev python-pip python-smbus git
sudo pip install RPi.GPIO

# STEP 4 ######################################################################
# Library installation
# GitHub archive has been downloaded into "[5] Adafruit_Python_MCP9808-master"
cd ~
git clone https://github.com/adafruit/Adafruit_Python_MCP9808.git
cd Adafruit_Python_MCP9808
sudo python setup.py install

# Run example script
cd examples
sudo python simpletest.py
