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
 
# This code generates a 16-point complex twiddle factor sequence, representing the real and imaginary parts, and then saves them into separate text files.

# Here's a quick breakdown of the code:

# It initializes arrays for real and imaginary components, each with 16 elements.
# Calculates the values for the real and imaginary components of the twiddle factors using trigonometric functions (math.cos and math.sin).
# Rounds the values and scales them by 256, likely for fixed-point representation.
# Converts these rounded values into binary strings of length 22, assuming they represent fixed-point numbers with 22 bits (including sign bit).
# Writes these binary strings into text files for the twiddle factors' real and imaginary parts.
# However, there might be an issue in the code:

# The assignment of bin_real[i] and bin_img[i] seems incorrect because it assigns r[i] and im[i] directly if the condition fails. It should convert the integers r[i] and im[i] to binary strings. You might want to replace bin_real[i] = r[i] and bin_img[i] = im[i] with bin_real[i] = format(r[i],'b').zfill(22) and bin_img[i] = format(im[i],'b').zfill(22) respectively.
# After this correction, the code should properly write the binary representations of the twiddle factors into the specified text files.

# ********************************************************************
# Module Function
def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val   

import math
real = [0 for _ in range(16)]
img = [0 for _ in range(16)]
r = [0 for _ in range(16)]
im = [0 for _ in range(16)]
for i in range(16):
    real[i] = math.cos(math.pi / 16 * i)
    img[i] = math.sin(math.pi / 16 * i) * (-1)

for i in range(16):
    r[i] = round(real[i] * 256)
    im[i] = round(img[i] * 256)
print(r)
print(im)

bin_real = [0 for _ in range(16)]
bin_img = [0 for _ in range(16)]

for i in range(16):
    bin_real[i] = format(r[i], '022b')  # Convert to binary with padding of 22 bits
    bin_img[i] = format(im[i], '022b')  # Convert to binary with padding of 22 bits

with open("twiddle_r.txt", "w") as text_file:
    for i in bin_real:
        text_file.write(str(i))
        text_file.write('\n')

with open("twiddle_i.txt", "w") as text_file:
    for i in bin_img:
        text_file.write(str(i))
        text_file.write('\n')
