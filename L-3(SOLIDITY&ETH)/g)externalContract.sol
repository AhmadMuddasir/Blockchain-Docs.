
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {ThirdcONTRCT,FirstContract} from "./f}twoContractInoneFile.sol";//we can 
//import multiple contract from a single file
//it is more prefered

contract secondContract{
     FirstContract public firstContract;//returns address of FirstContract


     function createContract() public{
          firstContract = new FirstContract();//deploys the contract and stores the address in the
          //firstcontract variable
     }

}