// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventDemo {
    // 定义一个事件
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 模拟转账函数
    function transfer(address to, uint256 amount) public {
        // 触发事件
        emit Transfer(msg.sender, to, amount);
    }
}