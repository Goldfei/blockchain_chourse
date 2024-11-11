// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PureFunctionDemo {
    uint public number = 10;

    // 默认函数：可以读取和修改状态变量
    function setNumber(uint _number) public {
        number = _number;  // 修改状态变量
    }

    // 纯函数，不访问状态变量
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}