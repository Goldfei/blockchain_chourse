// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestMappingDemo {
    // 定义一个 mapping，将地址映射到无符号整数
    mapping(address => uint) public balances;

    // 设置地址的余额
    function setBalance(address _address, uint _value) public {
        balances[_address] = _value;
    }

    // 获取地址的余额
    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }
}
