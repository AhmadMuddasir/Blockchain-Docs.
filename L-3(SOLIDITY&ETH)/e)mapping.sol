//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
// A mapping in Solidity is a key-value data structure that functions like a dictionary 
// It allows you to store and retrieve values efficiently using unique keys.


contract SimpleMapping {
    // Mapping from address to balance (uint)
    mapping(address => uint) public balances;

    // Function to set balance
    function setBalance(uint _amount) public {
        balances[msg.sender] = _amount;//address of person will be key and amount wil be value.
    }

    // Function to get balance
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}