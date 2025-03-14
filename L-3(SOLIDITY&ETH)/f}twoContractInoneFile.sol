// I'm a comment!
// SPDX-License-Identifier: MIT
//copy the code and paste it to remix ide to check how it works

pragma solidity >=0.8.0 <0.9.0;

contract FirstContract {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// contract secondContract{
//      FirstContract public firstContract;//returns address of FirstContract


//      function createContract() public{
//           firstContract = new FirstContract();//deploys the contract and stores the address in the
//           //firstcontract variable
//      }

// }

//this all contract can export to other contract together-
contract ThirdcONTRCT{}
// contract 4THcONTRCT{}
// contract 5THcONTRCT{}