//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import {FirstContract} from "./f}twoContractInoneFile.sol";

contract StorageFactory {

     FirstContract[] public listoFFirstContract;//"FirstContract" refers to contract but "FirstContract" refers to variable of that contract.

     function createFirstContract() public {
          FirstContract NEWFirstContract = new FirstContract();
          listoFFirstContract.push(NEWFirstContract);

     }


          function sfStore(uint _FirstContractIndex,uint _newFirstContractNmbr) public{
          //we need Address and ABI-Application binary interface.
          FirstContract myFirstContract = listoFFirstContract[_FirstContractIndex];
          myFirstContract.store(_newFirstContractNmbr);

     }

     function sfGet(uint256 _FirstContractIndex) public view returns(uint256){
          FirstContract myFirstContract = listoFFirstContract[_FirstContractIndex];
          return myFirstContract.retrieve();

     }
}

