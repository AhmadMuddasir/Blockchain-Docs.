// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManualToken {
    mapping(address => uint) public balanceOf; //address of person is key and uint is amount which is value;

    mapping(address => mapping(address => uint)) public allowance;
    //transfer tokens
    // subtract from address and add to address;

    function _transfer(address from, address to, uint amount) public {
        balanceOf[from] = balanceOf[from] - amount;
        balanceOf[to] += amount;
    }

    function transferFrom(address _from, address _to, uint _value) public returns(bool success){
          require(_value <= allowance[_from][msg.sender]);
          allowance[_from][msg.sender] -= _value;
          _transfer(_from, _to, _value);
          return true;
    }
}
