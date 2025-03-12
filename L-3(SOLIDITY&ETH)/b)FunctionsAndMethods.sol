1. Based on Visibility
Solidity has four function visibility types:

a) Public Functions
Can be called internally (within the contract) and externally (outside the contract).
By default, functions are public if not specified.
Example:
solidity

pragma solidity ^0.8.0;

contract Example {
    function publicFunction() public pure returns (string memory) {
        return "I am public";
    }
}

b) Private Functions
Can only be accessed within the same contract.
Not inherited by derived contracts.
Example:
solidity

contract Example {
    function privateFunction() private pure returns (string memory) {
        return "I am private";
    }
}

c) Internal Functions
Can be accessed within the contract and in derived contracts (child contracts).
Similar to private, but supports inheritance.
Example:
solidity

contract Parent {
    function internalFunction() internal pure returns (string memory) {
        return "I am internal";
    }
}

contract Child is Parent {
    function callInternal() public pure returns (string memory) {
        return internalFunction(); // Allowed in derived contract
    }
}

d) External Functions
Can only be called outside the contract.
Cannot be accessed internally using this.functionName(), but can be accessed using address(this).functionName().
Example:
solidity

contract Example {
    function externalFunction() external pure returns (string memory) {
        return "I am external";
    }
}

2. Based on Behavior
Solidity functions also differ based on their behavior:

a) View Functions
Read-only functions that do not modify the blockchain.
Can read state variables but cannot change them.
Example:
solidity

contract Example {
    uint public num = 100;

    function getNumber() public view returns (uint) {
        return num;
    }
}

b) Pure Functions
Cannot read or modify blockchain state.
Used when no state variable interaction is needed.
Example:
solidity

contract Example {
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}

c) Payable Functions
Allows the function to receive Ether (ETH).
Used for transactions that involve payments.
Example:
solidity

contract Example {
    function payMe() public payable {
        // Accepts ETH payments
    }
}


3. Special Function Types

a) Constructor
Runs once when the contract is deployed.
Used for initializing state variables.
Example:
solidity

contract Example {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

b) Fallback Function
Triggered when a contract receives Ether without calling a function.
Has no name, no arguments, and no return type.
Example:
solidity

contract Example {
    fallback() external payable {
        // This runs if no function matches the call
    }
}
c) Receive Function
Special function to receive Ether without data.
Used when a contract is sent Ether directly.
Example:
solidity

contract Example {
    receive() external payable {
        // This executes when ETH is sent directly
    }
}

