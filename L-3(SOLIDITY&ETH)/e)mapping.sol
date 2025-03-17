//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
// A mapping in Solidity is a key-value data structure that functions like a dictionary 
// It allows you to store and retrieve values efficiently using unique keys.


contract SimpleMapping1 {
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


//2nd Exp
contract SimpleMapping2 {
    // Mapping from address to balance (uint)

    struct People{
        string name;
        uint age;
    }
    People[] public peoples;// an array to store peaople

    mapping(string => uint) public NametoAge;

    // Function to set balance
    function setPeople(string memory _name,uint _age) public {
        // People memory people = People(_name,_age);
        // peoples.push(people);

        peoples.push(People(_name,_age));
        NametoAge[_name] = _age;
    }

    // Function to get balance
    function getBalance(string memory _name) public view returns (uint) {
        return NametoAge[_name];
    }
}