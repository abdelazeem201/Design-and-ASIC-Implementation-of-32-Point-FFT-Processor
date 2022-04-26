## *Introduction:*
I present a novel pipelined fast Fourier transform (FFT) architecture which is capable of producing the output sequence in normal order. A single-path delay commutator processing element (SDC PE) has been proposed for the first time. It saves a complex adder compared with the typical radix-2 butterfly unit. The new pipelined architecture can be built using the proposed processing element. The proposed architecture can lead to 100% hardware utilization and 50% reduction in the overall number of adders required in the conventional pipelined FFT designs. In order to produce the output sequence in normal order, we also present a bit reverser, which can achieve a 50% reduction in memory usage.

<img src= "https://github.com/abdelazeem201/Design-and-ASICImplementation-of-32-Point-FFT-Processor/blob/main/Pics/design.png">

## *Pre-Synthesis Simulation*

using QuestaSim
<img src= "https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor/blob/main/Pics/SIMULATION.png">

## *Synthesize:*

I have succeeded synthesis the design and met  my constraints.

## Design Specification
|Spec        | value         |
|----------- | ------------- |
|Cycle time  | (10) ns       |
|Total area  | 202213.12 µm^2|
|Power       | 9.9519 mW     |
|Techonlogy  | UMC 130nm     | 

<img src= "https://github.com/abdelazeem201/Design-and-ASICImplementation-of-32-Point-FFT-Processor/blob/main/Pics/FFT.png">

*1- Delay Block:* 

The delay blocks are is simply a FIFO shift register. It will shift 24 bits every cycle. For delay 16, the shift register size is 16x24 = 384.

<img src= "https://github.com/abdelazeem201/Design-and-ASICImplementation-of-32-Point-FFT-Processor/blob/main/Pics/shift.png">

*2- RADIX-2 BUTTERFLY*  
While entering the first radix-2 butterfly, din is extended to 24bits to match the twiddle factor. The radix-2 butterfly is the core processor of this circuit. It contains three states :  
1. Waiting: In waiting state, we cannot do any calculation. For instance, we have to wait for x[16] in the first state to do x[0]+x[16], so x[0]~x[15] will be in waiting state.
2. First Half: In the first half, the output will be the summation of two index, e.g. x[0]+x[16]. We will output x[0]-x[16] to delay module simultaneously.
3. Second Half: In the last state, we multiply the delay signal, which is the signal we output to the delay module in the first half state, with our twiddle factor. Same as above, the input (din_a_r and din_b_r) will be output to the delay module. The complex number multiplication is transformed from 4 multiplication and 2 summation to 3 multiplication 5 summation.

<img src="https://github.com/abdelazeem201/Design-and-ASICImplementation-of-32-Point-FFT-Processor/blob/main/Pics/radix.png">

*4- ROM AND STATE CONTROL MODULE*  
The ROM is where the twiddle factors are stored. When it receives the valid signal from the front stage, it sets a counter. Based on the counter, it will output a state control output signal to the radix2 butterfly module. For the second half state where multiplication takes place, it will provide the needed twiddle factor.  

*5- SORT MODULE* 
Since we know the output signal order, we can simply control the order by directing the signal to a 2D array and place the value in the right place. For instance, the 2nd output is X[15], we can store it into result[15]. It will take 32 cycles to sort. To add on, the input of sort module is the most significant 16 bits of the output of the last radix-2 butterfly.

## *PnR:*

I have succeeded to meet my time constraints, and all the test-bench data passed, meaning that our functionality of layout works fine.

<img src= "https://github.com/abdelazeem201/Design-and-ASICImplementation-of-32-Point-FFT-Processor/blob/main/Pics/GDS.png">
  
 The CMOS 0.13 μm is used to design Application Specific Integrated Circuit (ASIC) for the proposed FFT processor and it works with an input size of 32 bits at the operating frequency of 100 MHz, occupies an area of 1.27 mm and consumes 28 mW, at an operating voltage of 1.2V.Obtained results are compared with existing methods in terms of input word length, throughput, power dissipation and it shows that the proposed architecture gives high throughput, uses 3x more word length and 2x less power dissipation.
