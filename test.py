import time
import Adafruit_MCP9808.MCP9808 as MCP9808

# Default constructor will use the default I2C address (0x18) and pick a default I2C bus.
#
# For the Raspberry Pi this means you should hook up to the only exposed I2C bus
# from the main GPIO header and the library will figure out the bus number based
# on the Pi's revision.
#
sensor = MCP9808.MCP9808()

# Optionally you can override the address and/or bus number:
#sensor = MCP9808.MCP9808(address=0x20, busnum=2)

# Initialize communication with the sensor.
sensor.begin()

while True:
    temp = sensor.readTempC()
    print('T = {0:0.3F}*C'.format(temp))
    time.sleep(1.0)

