#!/usr/bin/env python
# coding=UTF-8

import math, subprocess, locale

encoding = locale.getdefaultlocale()[1]

c = subprocess.Popen(["acpi", "-b"], stdout=subprocess.PIPE)
output, err = c.communicate()
d1 = output.decode(encoding).split('\n')[0].split(', ')[1]
d2 = output.decode(encoding).split('\n')[1].split(', ')[1]
charge1 = float(d1.strip()[:-1])
charge2 = float(d2.strip()[:-1])
charge = (charge1 + charge2)/2

charge_threshold = int(math.ceil(charge / 10))

# Output

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
empty = (total_slots - len(filled)) * u'▹'

out = (filled + empty).encode('utf-8')
import sys

#color_green = '%{\033[32m%}'
#color_yellow = '%{\033[33m%}'
#color_red = '%{\033[31m%}'
#color_reset = '%{\033[0m%}'

color_green = '\033[32m'
color_yellow = '\033[33m'
color_red = '\033[31m'
color_reset = '\033[0m'


color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)
out = color_out + out + color_reset
print(out)
#sys.stdout.write(out)
