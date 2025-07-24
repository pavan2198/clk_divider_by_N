# Verilog Clock Divider Project

This project shows you how to make two types of simple and useful "clock dividers" in Verilog. These are common tools used in FPGA designs to make some parts of your logic run slower than the main system clock.

## What's in this Project?

There are three main Verilog files:

*   **`clk_divider_by_2N.sv`**: This design takes a fast clock and creates a new, much slower clock.
*   **`strobe_generator.sv`**: This design doesn't create a new clock. Instead, it creates a single "tick" or pulse every so often.
*   **`tb_dividers.sv`**: This is the test file we use to check if the other two files are working correctly.

---

## Explanation of the Designs

### Design 1: The Slower Clock Generator (`clk_divider_by_2N.sv`)

This module's job is simple: take a fast clock and create a new clock that is exactly **2 \* N** times slower.

**How it Works:**
It has a counter inside. It counts from 0 up to `N-1`. Every time it finishes counting, it just flips the output clock signal (from ON to OFF, or from OFF to ON).

The result is that the new, slow clock will be high for `N` cycles of the fast clock, and then low for `N` cycles of the fast clock. This gives it a perfect 50% duty cycle.

### Design 2: The Strobe Generator (`strobe_generator.sv`)

Sometimes, you don't need a whole new slow clock. You just need a signal that says **"GO!"** every so often to trigger an action.

This module does exactly that. It creates a single, short pulse (called a "tick" or "strobe") every `N` clock cycles. It's like a metronome that clicks just once every `N` beats. The output signal is high for only one clock cycle and then goes back to being low.

---

## How to Run This Project

You can simulate this project using any Verilog tool (like Vivado, ModelSim, or an online one like EDA Playground).

1.  Put all three `.sv` files into your simulator.
2.  Set **`tb_dividers.sv`** as the "Top" module for the simulation.
3.  Run the simulation for about `300 ns` to see the results.

## What to Look For in the Waveform

When you run the test, you will see a few signals:

*   **`clk_in`**: This is the main, fast clock.
*   **`clk_div3_out`**: This is the output from our first design (with `N=3`). You will see it is a much slower square wave. It will be high for 3 fast clock cycles and low for 3 fast clock cycles.
*   **`tick_div4_out`**: This is the output from our second design (with `N=4`). You will see it is low almost all the time, with a single, short spike happening every 4 fast clock cycles.
