Events and emit in Solidity
Events in Solidity are a way for smart contracts to communicate with external consumers (like a frontend application) by logging data on the blockchain. The emit keyword is used to trigger an event.

Why Use Events?
Efficient Logging - Events are stored in transaction logs, making them cheaper than storing data in contract storage.
Interaction with Frontend - External applications (e.g., dApps) can listen to events and respond accordingly.
Transparent Debugging - Helps in tracking contract behavior.
Example 1: Basic Event for a Transaction
solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionLogger {
    event Transfer(address indexed sender, address indexed receiver, uint256 amount);

    function sendMoney(address payable _receiver) public payable {
        require(msg.value > 0, "Send some ETH!");
        _receiver.transfer(msg.value);
        emit Transfer(msg.sender, _receiver, msg.value);
    }
}
Explanation:

Transfer event is triggered when a transaction occurs.
The indexed keyword allows filtering by specific addresses.
The emit statement logs the event.
Example 2: Tracking Ownership Change
solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownership {
    address public owner;
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only owner can transfer ownership");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
Explanation:

Logs when contract ownership is transferred.
Helps in tracking ownership changes transparently.
Example 3: Voting System
solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) public hasVoted;
    
    event Voted(address indexed voter);

    function vote() public {
        require(!hasVoted[msg.sender], "You have already voted!");
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender);
    }
}
Explanation:

Emits a Voted event when a user votes.
Helps track voting activities without storing excessive on-chain data.