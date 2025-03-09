//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;// this "^" means the solidity version will work grater then it eg-0.8.20 or 0.8.21 but not less then 0.8.19.
//or
// pragma solidity >=0.8.18<0.9.0; // it states the version either greater 0.8.18 and less then 0.9.0;

contract SimpleStorage {// name of contract is SimpleStorage so we need to give

//Basic Types:boolean,uint,int,address,bytes
//1byte=8bit.
uint256 public storedData; //uint is a data type for number with no decimal 
// values and stores numbers without decimals. 256 means upto 256 bit storage in solidity
// or memory size of this contract. We can also use it to store the address, which will be explained later on.

// bool eithertrueorfalse = true;
// address myaddress = 0x5B38Da6a70dDB9;

bytes32 myBytes = "cat"; //string are basically byte objects specifically for the text.


}
