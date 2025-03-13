//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract exp{
     struct Person{
          uint age;
          string name;
     }

     Person[] public listOfPeople;

     function addperson(string memory _name,uint _age) public {
          Person memory newperson = Person(_age,_name);
          listOfPeople.push(newperson);
     }
}
