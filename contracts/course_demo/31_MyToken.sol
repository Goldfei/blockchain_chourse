// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20("My Token", " QXTK"), Ownable(address(msg.sender)) {
    constructor(uint256 initialSupply){
        _mint(msg.sender, initialSupply * (10 ** uint256(decimals())));
    }

    // 你可以添加额外的功能，例如只允许合约拥有者增加供应量
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
