
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {ThirdcONTRCT,FirstContract} from "./f}twoContractInoneFile.sol";//we can 
//import multiple contract from a single file
//it is more prefered

contract secondContract{
     FirstContract[] public firstContractList;//returns address of FirstContract


     function createContract() public{
          FirstContract newContract= new FirstContract();//deploys the contract and stores the address in the
          //firstcontract variable
          firstContractList.push(newContract);

     }


     function sfStore(uint _simpleStorageIndex,uint _newSimpleStorageNmbr) public{
          //we need Address and ABI-Application binary interface.
     //when compile a contrace we automatically get the Abi.

     // FirstContract storeValue = firstContractList[_simpleStorageIndex];
     // storeValue.store(_newSimpleStorageNmbr);
     // above two lines can also be written as->
     firstContractList[_simpleStorageIndex].store(_newSimpleStorageNmbr);
     }

     function getSF(uint _index) public view returns(uint){
          // FirstContract getNumber = firstContractList[_index];
          // return getNumber.retrieve();  
          // this can also be written as->
          return firstContractList[_index].retrieve();
     }

}