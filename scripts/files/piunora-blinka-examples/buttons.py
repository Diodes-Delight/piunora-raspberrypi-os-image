import board
import digitalio
import busio
import time
from digitalio import DigitalInOut, Direction, Pull

button_back = DigitalInOut(board.D26)
button_back.direction = Direction.INPUT
button_back.pull = Pull.UP

button_side = DigitalInOut(board.D25)
button_side.direction = Direction.INPUT
button_side.pull = Pull.UP

print('Press Ctrl-C to quit.')

while True:
	print('Back button: '+str(button_back.value))
	print('Side button: '+str(button_side.value))
	time.sleep(0.1)
