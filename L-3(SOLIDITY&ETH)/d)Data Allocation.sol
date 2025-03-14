
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
//Data Allocation in Solidity
//In Solidity, data is stored in three main locations: Storage,
//Memory, and Stack. Each has its own behavior, cost, and scope. 
//it  helps optimize gas usage and smart contract efficiency.

// 1. Storage
// Persistent (Stored on Blockchain)
// Expensive in terms of gas cost.
// Used for state variables that must be retained between function calls.

contract Example1 {
    uint public storedNumber; // Stored in "storage" if u create a variable out of a function 
    //that by default stored in storage.

    function setNumber(uint _num) public {
        storedNumber = _num; // Changing storage data (costly)
    }
}
// Key Points:
// State variables (declared outside functions) are stored in storage.
// Modifying storage variables costs high gas fees.


// 2. Memory
// Temporary (Only during function execution)
// Cheaper than storage.
// Used for storing function arguments, structs, and arrays inside a function.

contract Example2 {
    function getString(string memory _input) public pure returns (string memory) {
        return _input; // Stored in memory (temporary)
    }
}

// Key Points:
// Used for function parameters and local variables.
// Data is lost after the function executes.
// Strings, arrays, and structs must use memory when passed as function parameters.


// 3. Stack
// Super-fast, Low-cost storage (Used for small values like uint, bool).
// Holds local variables inside functions.
// Max size is 1024 slots, exceeding this causes a stack overflow.

contract Example3 {
    function addNumbers() public pure returns (uint) {
        uint a = 5; // Stored in stack
        uint b = 10; // Stored in stack
        return a + b; // Calculation happens in stack
    }
}
// Key Points:
// Used for small local variables like uint, bool, address.
// Super efficient, but can't store complex data types like arrays.


//4. Calldata

// Temporary, Read-Only Memory
// Used for function arguments of external functions.
// Cheaper than memory because it's immutable (cannot be modified).

contract Example4 {
    function getCalldataString(string calldata _input) external pure returns (string calldata) {
        return _input; // Stored in calldata (more efficient)
    }
}

// Key Points:
// Used in external functions for string, bytes, and arrays.
// Cannot be modified, making it gas-efficient.


// Comparison Table
// Storage Type	|Persistence	           |  Gas Cost	   |           Usage
//__________________|_________________________|________________|______________________________________
// Storage	     |Permanent(Blockchain)	 | High	        | State variables
// Memory	          |Temporary(Per function)	 | Medium	        | Function arguments, local structs/arrays
// Stack	          |Temporary(Per function)	 | Low	        | Small local variables (uint, bool)
// Calldata	     |Temporary(External Calls)| Lowest	External| function parameters (immutable)