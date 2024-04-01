# Single_Cycle_Arbiter
### RTL Summary: Single Cycle Arbiter

- **Engineer**: Abhishek Kumar Kushwaha
- **Create Date**: 01.04.2024 14:24:44
- **Module Name**: single_cycle_arbiter
- **Parameter**: N = 32

#### Description:
The `single_cycle_arbiter` module is designed to implement a single-cycle arbitration logic. It takes an array of request inputs (`req_i`) and generates an array of grant outputs (`gnt_o`). The arbitration is based on a priority scheme where the highest priority request is granted. The module utilizes a priority queue to determine the grant output.

#### Functionality:
- **Inputs**:
  - `req_i`: Array of request inputs, each representing a request from a specific source.
- **Outputs**:
  - `gnt_o`: Array of grant outputs, each indicating whether a request is granted or not.

#### Operation:
1. **Priority Queue Generation**:
   - The module calculates a priority queue (`priority_q`) based on the request inputs (`req_i`).
   - The priority queue determines the priority of each request, where higher indices correspond to higher priority.

2. **Grant Output Calculation**:
   - The priority queue is inverted to create an inverted priority queue (`inv`).
   - The grant output (`gnt_o`) is calculated as the bitwise AND of the inverted priority queue (`inv`) and the request inputs (`req_i`).
   - This logic ensures that the highest priority request is granted, while lower priority requests are masked.

#### Dependencies:
- None

#### Revision History:
- Revision 0.01: File Created

#### Additional Comments:
- The module is designed to operate in a single-cycle fashion, providing fast and efficient arbitration for multiple request sources.

<img width="845" alt="image" src="https://github.com/Abhirecket/Single_Cycle_Arbiter/assets/46784291/9fbcb954-bd1d-47cf-8f6d-5b0ad73f04f6">

In Verilog, the `genvar` type is used to declare variables that are used as loop iterators within generate blocks. Generate blocks are used to instantiate modules or generate repetitive code based on specific conditions or parameters.

In the provided Verilog code for the `single_cycle_arbiter` module, the `genvar i;` declaration is used to declare a variable `i` of type `genvar`. This variable is then used as a loop iterator within a generate block to generate the logic for calculating the priority queue (`priority_q`).

Let's break down how `genvar i;` is used in the code:

```verilog
genvar i;
for (i = 0; i < N-1; i = i + 1) begin
    assign priority_q[i+1] = priority_q[i] | req_i[i];
end
```

In this code snippet:
- `genvar i;` declares a `genvar` variable named `i`. This variable will be used as the loop iterator.
- The `for` loop iterates from `i = 0` to `i = N-2` (because `i` starts from 0 and goes up to `N-2` to cover indices 0 to `N-2` of `priority_q` array).
- Inside the loop, the `assign` statement generates logic to calculate each element of the priority queue `priority_q`. Each element `priority_q[i+1]` is calculated based on the previous element `priority_q[i]` and the corresponding request input `req_i[i]`.

In summary, the `genvar i;` declaration allows the use of a loop iterator (`i`) within a generate block to generate repetitive logic for calculating the priority queue in the `single_cycle_arbiter` module. It helps to simplify and automate the generation of code for multiple elements of the `priority_q` array.

