// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RegularPoints is ERC20("RegularPoints", "RPT") {
    // 映射存储用户指定的积分名称
    mapping(address => string) public customNames;

    // 用户可以自定义积分名称
    function setCustomName(string memory name) external {
        customNames[msg.sender] = name;
    }

    // 用户可以自由铸造普通积分
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    // 获取用户的自定义积分名称
    function getCustomName(address user) external view returns (string memory) {
        return customNames[user];
    }
}
