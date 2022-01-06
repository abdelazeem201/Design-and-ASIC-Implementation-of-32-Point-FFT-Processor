# --------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
# --------------------------------------------------------------------
# Author: Ahmed Abdelazeem
# Github: https://github.com/abdelazeem201
# Email: ahmed_abdelazeem@outlook.com
# Description: twiddle_gen.py
# Dependencies: 
# Since: 2021-12-2 10:10:59
# LastEditors: ahmed abdelazeem
# LastEditTime: 2021-12-2 10:10:59
# ********************************************************************
# Module Function
def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val   

import math
real = [0 for i in range(16)]
img = [0 for i in range(16)]
r = [0 for i in range(16)]
im = [0 for i in range(16)]
for i in range(16):
    real[i] = math.cos(math.pi/16*i)
    img[i]  = math.sin(math.pi/16*i)*(-1)

for i in range(16):
    r[i] = round(real[i]*256)
    im[i] = round(img[i]*256)
print(r)
print(im)

bin_real = [0 for i in range(16)]
bin_img  = [0 for i in range(16)]

for i in range(16):
    if int(bin_real[i]) > 0 :
        bin_real[i] = format(r[i],'b').zfill(22)
    else:
        bin_real[i] = r[i]
    if bin_img[i] > 0:
        bin_img[i]  = format(im[i],'b').zfill(22)
    else:
        bin_img[i] = im[i]


with open("twiddle_r.txt", "w") as text_file:
    for i in bin_real:
        text_file.write(str(i))
        text_file.write('\n')

with open("twiddle_i.txt", "w") as text_file:
    for i in bin_img:
        text_file.write(str(i))
        text_file.write('\n')
