# Sum of Products – Verilog Project

## Overview

This project, titled **Sum of Products**, is a modular Verilog design and verification lab that implements a four-stage pipeline for computing a weighted sum of products. It serves as a practical exercise in digital design, pipelining, testbench development, and simulation-based verification using Synopsys VCS.

### Project Objective

The system calculates the final output as:

```
final_out = (d1 * c1 + d2 * c2) + (d3 * c3 + d4 * c4)
```

where `d1–d4` are data inputs and `c1–c4` are coefficient inputs.

---

## File Structure

```bash
├── adder.v               # 2-input adder module
├── mult.v                # 2-input multiplier module
├── reg.v                 # Register module with enable/reset
├── level_2.v             # Intermediate processing module
├── top.v                 # Top-level module connecting all components
├── exhaustive_tb.v       # Exhaustive testbench for all input combinations
├── non_exhaustive_tb.v   # Simplified functional testbench
├── ErrorFree.log         # Log showing successful execution
├── ForceError.log        # Log showing an intentionally injected error
├── ForceError_test_passing.log  # Log from passing all tests
```

---

## How It Works

The system is composed of a pipeline of modules:

1. **Multipliers**: Four `mult` modules compute `dX * cX` in parallel.
2. **Adders & Level-2 Logic**: Intermediate sums are computed via `level_2.v`.
3. **Final Output**: Two partial sums are added to form the final result.
4. **Registers**: Ensure proper data synchronization across clock cycles.

The testbenches feed in values to simulate and verify functionality:
- `non_exhaustive_tb.v` runs a set of common test cases.
- `exhaustive_tb.v` tests every possible 4-bit combination to verify correctness and catch edge cases.

---

## Running the Simulation

To compile and run this project using Synopsys VCS:

```bash
vcs top.v adder.v mult.v reg.v level_2.v exhaustive_tb.v -o simv
./simv -l simulation.log
```

To test for errors:

```bash
./simv -l ForceError.log      # For error injection
./simv -l ForceError_test_passing.log  # For successful tests
```

---

## What to Expect

- **Correct Output**: When error-free, the simulator produces expected results for all valid inputs (see `ErrorFree.log` and `ForceError_test_passing.log`).
- **Error Reporting**: When faults are injected, mismatches between expected and actual outputs are flagged (see `ForceError.log`).
- **Scalable Design**: All modules are reusable and parameterized for extension or integration into more complex datapaths.

---

## Learning Outcomes

This lab reinforces the following core concepts:
- RTL design and modular decomposition
- Pipelining and timing control
- Functional and exhaustive testbench creation
- Debugging using simulation logs

---

## Author

Abrar –
