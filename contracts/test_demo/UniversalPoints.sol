// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UniversalPoints is ERC20("UniversalPoints", " UPT"), Ownable(address(msg.sender)) {
    // 初始化通用积分总发行量
    constructor(uint256 initialSupply){
        _mint(msg.sender, initialSupply * (10 ** uint256(decimals())));
    }

    // 只有合约拥有者可以发行通用积分（UPT）
    function issueUPT(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
