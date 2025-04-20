// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MyToken is ERC20, ERC20Burnable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Explicitly define burn function (optional, as it's already inherited)
    function burn(uint256 amount) public virtual override {
        _burn(msg.sender, amount);
    }

    // Explicitly define burnFrom function (optional, as it's already inherited)
    function burnFrom(address account, uint256 amount) public virtual override {
        _spendAllowance(account, msg.sender, amount);
        _burn(account, amount);
    }
}