import busio
import time
import digitalio
import board
from rpi_ws281x import PixelStrip, Color
import simpleio
import math

print('This examples needs to be run as root (sudo)')
# LED strip configuration:
LED_COUNT = 1        # Number of LED pixels.
LED_PIN = 12          # GPIO pin connected to the pixels (18 uses PWM!).
# LED_PIN = 10        # GPIO pin connected to the pixels (10 uses SPI /dev/spidev0.0).
LED_FREQ_HZ = 800000  # LED signal frequency in hertz (usually 800khz)
LED_DMA = 10          # DMA channel to use for generating signal (try 10)
LED_BRIGHTNESS = 25  # Set to 0 for darkest and 255 for brightest
LED_INVERT = False    # True to invert the signal (when using NPN transistor level shift)
LED_CHANNEL = 0       # set to '1' for GPIOs 13, 19, 41, 45 or 53

strip = PixelStrip(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS, LED_CHANNEL)
# Intialize the library (must be called once before other functions).
strip.begin()

print('Press Ctrl-C to quit.')

while True:
	strip.setPixelColor(0,Color(255,0,0))
	time.sleep(0.3)
	strip.show()
	strip.setPixelColor(0,Color(0,255,0))
	time.sleep(0.3)
	strip.show()
	strip.setPixelColor(0,Color(0,0,255))
	time.sleep(0.3)
	strip.show()


