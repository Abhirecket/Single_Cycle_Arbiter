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
