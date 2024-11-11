// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewFunctionDemo {
    uint public number = 10;
    // 只读函数，读取状态变量
    function getNumber() public view returns (uint) {
        return number;
    }
}