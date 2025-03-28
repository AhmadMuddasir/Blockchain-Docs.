// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./PriceConverter.sol";
contract FundMe {
    using PriceConverter for uint256; // Attach library functions to uint256 type

    uint public minimumUSD = 5e18; // Minimum funding amount in USD (5 USD)
    address[] public s_funders;
    mapping(address => uint) public s_addressToAmountFunded;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable onlyOwner{
        
    require(msg.sender == owner,"only the owner can fund" );
    // Check if the sent value meets the minimum USD requirement
    require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough funds (1 ETH = 1e18 wei)");

    // Update the funder's contribution
    s_addressToAmountFunded[msg.sender] += msg.value;
    s_funders.push(msg.sender);
    }

    function withdraw() public onlyOwner{
        for(uint funderIndex = 0;funderIndex < s_funders.length;funderIndex++){
            address funder = s_funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;

        }
        //resetting an array
        s_funders = new address[](0);
        // 3 different ways to transfer money-
        //transfer (most used and simple)but-
        //the tranfer method maximum gas value capped is 2300 if it increases then throws error.
        //send (2300 gas if increases returns bool);
        //call(forward all gas or set gas,returns bool);

        //transfer-
        // payable(msg.sender).transfer(address(this).balance);//automatically reverts.
        // //send
        // bool sendSuccess =  payable(msg.sender).send(address(this).balance);//send will only revert if we add require
        // require(sendSuccess,"send failed");
        //call-it returns two variables
        (bool callSuccess ,/*bytes memory dataReturned*/)= payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess,"call failed");



    }

    //modifier - 
    modifier onlyOwner(){
        require(msg.sender == owner, "only the owner can execute this function");//executes
        _;//this means what ever else in the function;
    }
}
