# --------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
# --------------------------------------------------------------------
# Author: Ahmed Abdelazeem
# Github: https://github.com/abdelazeem201
# Email: ahmed_abdelazeem@outlook.com
# Description: FFT.py
# Dependencies: 
# Since: 2021-12-2 5:16:50
# LastEditors: ahmed abdelazeem
# LastEditTime: 2021-12-2 5:16:50

# Description
# I've implemented a multi-stage computation using the radix-2 FFT (Fast Fourier Transform) algorithm. Each stage performs specific operations on the input data and generates output. The process is sequential and iterative, resulting in a final set of computed values.

# Here's a general summary of what each stage appears to do:
# 1. Stage 1: Computes additions and subtractions based on the input data (mem and img) and applies multiplication by complex twiddle factors (w and w_i).
# 2. Stages 2-5: Repeat similar computations but with different grouping and computation arrangements.
# The code follows a common structure seen in FFT algorithms where data is sequentially manipulated through stages, each refining the frequency domain representation of the input data.
# The final output seems to be stored in final_ans_r and final_ans_i, which are arrays holding the computed real and imaginary parts of the FFT result.
#

# ********************************************************************
# Module Function
n = 0
mem = []
img = []
stage1_r = []
stage1_i = []
minus_r = []
minus_i = []

w = [0 for i in range(16)]
w_i = [0 for i in range(16)]

with open("IN_real_pattern01.txt") as f:
    for line_terminated in f:
        line = line_terminated.rstrip('\n')
        tmpStr = ''
        for i in range(0,len(line)):
            tmpStr+=line[i]
        mem.append(tmpStr)

with open("IN_imag_pattern01.txt") as f:
    for line_terminated in f:
        line = line_terminated.rstrip('\n')
        tmpStr = ''
        for i in range(0,len(line)):
            tmpStr+=line[i]
        img.append(tmpStr)
w[0] =   1       
w[1] =  0.98078
w[2] =  0.92397
w[3] =  0.83147
w[4] =  0.7071
w[5] =  0.5555 
w[6] =  0.3826  
w[7] =  0.1951  
w[8] =  0
for i in range(1,8):
    w[8+i] = (w[8-i]*(-1))       

w_i[0] = 0
w_i[1] = -0.1950
w_i[2] = -0.3826
w_i[3] = -0.555
w_i[4] = -0.707
w_i[5] = -0.831
w_i[6] = -0.9238
w_i[7] = -0.9807
w_i[8] = -1
for i in range(1,8):
    w_i[8+i] = w_i[8-i]

print('-------------stage 1 answers------------- ')
for i in range(0,16):
    stage1_r.append(float(mem[i])+float(mem[i+16]))
    stage1_i.append(float(img[i])+float(img[i+16]))

for j in range(0,16):
    minus_r.append(((float(mem[j])-float(mem[j+16]))))
    minus_i.append(((float(img[j])-float(img[j+16]))))

for i in range(0,16):
    stage1_r.append((float(minus_r[i])*float(w[i])) - (float(minus_i[i])*float(w_i[i])))
    stage1_i.append((float(minus_i[i])*float(w[i])) + (float(minus_r[i])*float(w_i[i])))

for i in range(len(stage1_r)):
    print(i,' : ',int(stage1_r[i]*64))
'''
with open("Output.txt", "w") as text_file:
    for i in ans:
        text_file.write(str(i*64))
        text_file.write('\n')
'''

#result saved in stage1_r and stage1_i

stage2_r = []
stage2_i = []
minus2_r = []
minus2_i = []
for x in range(2):
    for i in range(0,8):
        stage2_r.append(float(stage1_r[i+(16*x)])+float(stage1_r[i+8+(16*x)]))
        stage2_i.append(float(stage1_i[i+(16*x)])+float(stage1_i[i+8+(16*x)]))

    for j in range(0,8):
        minus2_r.append(((float(stage1_r[j+(16*x)])-float(stage1_r[j+8+(16*x)]))))
        minus2_i.append(((float(stage1_i[j+(16*x)])-float(stage1_i[j+8+(16*x)]))))

    for i in range(0,8):
        stage2_r.append((float(minus2_r[i+(8*x)])*float(w[(i*2)])) - (float(minus2_i[i+(8*x)])*float(w_i[(i*2)])))
        stage2_i.append((float(minus2_i[i+(8*x)])*float(w[(i*2)])) + (float(minus2_r[i+(8*x)])*float(w_i[(i*2)])))

print('-------------stage 2 answers------------- ')

for i in range(len(stage2_r)):
    print(i,' : ',int(stage2_r[i]*64),int(stage2_i[i]*64),'i')

stage3_r = []
stage3_i = []
minus3_r = []
minus3_i = []

for x in range(4):
    for i in range(0,4):
        stage3_r.append(float(stage2_r[i+(8*x)])+float(stage2_r[i+4+(8*x)]))
        stage3_i.append(float(stage2_i[i+(8*x)])+float(stage2_i[i+4+(8*x)]))

    for j in range(0,4):
        minus3_r.append(((float(stage2_r[j+(8*x)])-float(stage2_r[j+4+(8*x)]))))
        minus3_i.append(((float(stage2_i[j+(8*x)])-float(stage2_i[j+4+(8*x)]))))

    for i in range(0,4):
        stage3_r.append((float(minus3_r[i+(4*x)])*float(w[(i*4)])) - (float(minus3_i[i+(4*x)])*float(w_i[(i*4)])))
        stage3_i.append((float(minus3_i[i+(4*x)])*float(w[(i*4)])) + (float(minus3_r[i+(4*x)])*float(w_i[(i*4)])))
print('-------------stage 3 answers------------- ')

for i in range(len(stage3_r)):
    print(i,' : ',int(stage3_r[i]*64),int(stage3_i[i]*64),'i')

stage4_r = []
stage4_i = []
minus4_r = []
minus4_i = []

for x in range(8):
    for i in range(0,2):
        stage4_r.append(float(stage3_r[i+(4*x)])+float(stage3_r[i+2+(4*x)]))
        stage4_i.append(float(stage3_i[i+(4*x)])+float(stage3_i[i+2+(4*x)]))

    for j in range(0,2):
        minus4_r.append(((float(stage3_r[j+(4*x)])-float(stage3_r[j+2+(4*x)]))))
        minus4_i.append(((float(stage3_i[j+(4*x)])-float(stage3_i[j+2+(4*x)]))))

    for i in range(0,2):
        stage4_r.append((float(minus4_r[i+(2*x)])*float(w[(i*8)])) - (float(minus4_i[i+(2*x)])*float(w_i[(i*8)])))
        stage4_i.append((float(minus4_i[i+(2*x)])*float(w[(i*8)])) + (float(minus4_r[i+(2*x)])*float(w_i[(i*8)])))
print('-------------stage 4 answers------------- ')

for i in range(len(stage4_r)):
    print(i,' : ',int(stage4_r[i]*64),int(stage4_i[i]*64),'i')

stage5_r = []
stage5_i = []
minus5_r = []
minus5_i = []
final_ans_r = [0 for i in range(32)]
final_ans_i = [0 for i in range(32)]
for x in range(16):
    for i in range(0,1):
        stage5_r.append(float(stage4_r[i+(2*x)])+float(stage4_r[i+1+(2*x)]))
        stage5_i.append(float(stage4_i[i+(2*x)])+float(stage4_i[i+1+(2*x)]))

    for j in range(0,1):
        minus5_r.append(((float(stage4_r[j+(2*x)])-float(stage4_r[j+1+(2*x)]))))
        minus5_i.append(((float(stage4_i[j+(2*x)])-float(stage4_i[j+1+(2*x)]))))

    for i in range(0,1):
        stage5_r.append((float(minus5_r[i+(x)])*float(w[(i*16)])) - (float(minus5_i[i+(x)])*float(w_i[(i*16)])))
        stage5_i.append((float(minus5_i[i+(x)])*float(w[(i*16)])) + (float(minus5_r[i+(x)])*float(w_i[(i*16)])))

print('-------------stage 5 answers------------- ')

for i in range(len(stage5_r)):
    print(i,' : ',int(stage5_r[i]*64),int(stage5_i[i]*64),'i')

print('-------------final answers------------- ')
for i in range(len(stage5_r)):
    r = int('{:05b}'.format(i)[::-1], 2)
    final_ans_r[r] = stage5_r[i]
    final_ans_i[r] = stage5_i[i]

for i in range(len(stage5_r)):
    print(i,' : ',int(final_ans_r[i]),int(final_ans_i[i]),'i')
