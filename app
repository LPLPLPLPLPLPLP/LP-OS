from mpython import *

def DIRECTION():
    global angle
    if angle < 10:
        oled.DispChar(str((str(int(angle)))), 62, 24, 1)
    elif angle < 100:
        oled.DispChar(str((str(int(angle)))), 58, 24, 1)
    else:
        oled.DispChar(str((str(int(angle)))), 55, 24, 1)
    if angle >= 338 or angle < 23:
        oled.DispChar(str('北'), 100, 4, 1)
    elif angle >= 23 and angle < 68:
        oled.DispChar(str('东北'), 100, 4, 1)
    elif angle >= 69 and angle < 113:
        oled.DispChar(str('东'), 100, 4, 1)
    elif angle >= 113 and angle < 158:
        oled.DispChar(str('东南'), 100, 4, 1)
    elif angle >= 158 and angle < 203:
        oled.DispChar(str('南'), 100, 4, 1)
    elif angle >= 203 and angle < 248:
        oled.DispChar(str('西南'), 100, 4, 1)
    elif angle >= 248 and angle < 293:
        oled.DispChar(str('西'), 100, 4, 1)
    elif angle >= 293 and angle < 338:
        oled.DispChar(str('西北'), 100, 4, 1)

angle = None

import math
magnetic.calibrate()
while not button_b.is_pressed():
    angle = magnetic.get_heading()
    oled.fill(0)
    oled.DispChar(str('指南针'), 0, 4, 1)
    oled.fill_circle(64, 32, 31, 1)
    oled.fill_circle(64, 32, 29, 0)
    oled.fill_circle((int((math.sin(angle / 180.0 * math.pi) * 28)) + 64), (int((math.cos(angle / 180.0 * math.pi) * 28)) + 32), 2, 1)
    DIRECTION()
    oled.show()
