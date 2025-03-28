// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./PriceConverter.sol";

error NotOwner(); //

contract FundMe {
    using PriceConverter for uint256; // Attach library functions to uint256 type
    //constant variable do not take space in  storage but global variable its just like a pointer
    uint public constant MINIMUM_USD = 5e18; // Minimum funding amount in USD (5 USD)
    //21415-con
    //23515-not con
    //21415 * 141000000000 = 3,01,95,15,00,00,00,000
    address[] public funders;
    mapping(address => uint) public addressToAmountFunded;

    //varibale which we set one timebut declared outside we can mark as immutable.
    address public immutable i_owner;

    // immutable-instead of storing the variables in the storage slots in stores t in bytecode of the contract
    constructor(){
        //we set this one inside a constructor se we can use immutable
        i_owner = msg.sender;
    }

    function fund() public payable onlyi_Owner{
        
        require(msg.sender == i_owner,"only the i_owner can fund" );
        // Check if the sent value meets the minimum USD requirement
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough funds (1 ETH = 1e18 wei)");

        // Update the funder's contribution
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function withdraw() public onlyi_Owner{
        for(uint funderIndex = 0;funderIndex < funders.length;funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }
        //resetting an array
        funders = new address[](0);
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
    modifier onlyi_Owner(){
        // require(msg.sender == i_owner, "only the i_owner can execute this function");//executes
        if(msg.sender != i_owner) {revert NotOwner();} //more gas efficient.
        _;//this means what ever else in the function;
    }

    receive() external payable{//Must be external & payable
    //if some one accidently sends the money to the contract it will still call the fund functions
        fund();
    }
    fallback() external payable {
        fund();
    }
}