// SPDX-Licence-Identifier:MIT;

pragma solidity ^0.8.18;

import {FirstContract} from "./f}twoContractInoneFile.sol";

// Inheritance (Code Reusability)
// Solidity allows one contract to inherit properties and methods from another contract using the is keyword.

// 🔹 Example: Parent-Child Contract Relationship

//1st example

// pragma solidity ^0.8.0;

// contract Parent {
//     uint256 public parentValue = 100;

//     function parentFunction() public pure returns (string memory) {
//         return "This is Parent Function";
//     }
// }

// contract Child is Parent {
//     function childFunction() public view returns (uint256) {
//         return parentValue; // Inherited from Parent contract
//     }
// }


//2nd example importing contract from different file

contract AddFiveStorage is FirstContract{
     //we are overriding a contract existing function so go to that function and write virtual
     //only then the override function will work 
    function store(uint256 _favoriteNumber) public  override {
        myFavoriteNumber = _favoriteNumber + 5;
    }


}
