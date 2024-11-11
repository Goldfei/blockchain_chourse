// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantDemo {
    /* constant常量 */
    uint256 public constant MAX_SUPPLY = 1000000;  // 必须在声明时初始化
    uint256 public constant PI = 3141592;  // 代表 3.141592

    /* immutable不变量 */
    address public immutable owner;
    // 在构造函数中初始化
    constructor() {
        owner = msg.sender;  // 在合约部署时设置所有者
    }
}