# counting_number_of_1
 Counting number of one's in a seven bit bus.

 ### RTL Description: Top Module

- **Module Name**: top
- **Inputs**:
  - `d_in`: Input bus of width 7 bits.
  - `clk`: Clock signal.
  - `rst`: Reset signal.
- **Outputs**:
  - `count`: Output register containing the count of set bits in the input bus.
- **Internal Signals**:
  - `count_nxt`: Next state of the count.
  - `s1`, `s2`, `s3`, `s4`: Intermediate sum signals.
  - `Cout1`, `Cout2`, `Cout3`, `Cout4`: Carry out signals from adders.
- **Description**:
  - The `top` module counts the number of set bits (1s) in the 7-bit input bus `d_in`.
  - Four full adders (`adder1` to `adder4`) are instantiated to perform partial addition operations on subsets of `d_in`.
  - Each full adder calculates the sum of three input bits along with a carry-in.
  - The carry-out (`Cout`) from each full adder is propagated to the next stage.
  - The intermediate sum signals (`s1` to `s4`) are used to capture the sum of the bits within each adder stage.
  - The final count is derived by concatenating the carry-out from the last stage (`Cout3`) with the sum signals (`s3` and `s4`).
  - On each positive clock edge, the value of `count_nxt` is assigned to the output register `count`.
  - The output register is reset to `000` on the rising edge of the reset signal (`rst`).
- **Dependencies**:
  - This module depends on the `full_adder` module, which is assumed to be defined elsewhere.
- **Additional Comments**:
  - The implementation utilizes a parallel adder architecture to efficiently compute the count of set bits in the input bus.
