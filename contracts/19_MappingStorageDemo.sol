// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingStorageDemo {
    // 映射：将地址映射到余额
    mapping(address => uint256) public balances;
    
    // 添加或更新用户的余额
    function setBalance(uint256 amount) public {
        balances[msg.sender] = amount; // 将调用者的余额设置为指定的值
    }

    // 获取指定地址的余额
    function getBalance(address user) public view returns (uint256) {
        return balances[user]; // 返回用户的余额
    }
    
    // 演示如何计算存储位置
    function computeStorageLocation(address key) public pure returns (bytes32) {
        // 获取映射的槽位，假设槽位为 0（即第一个状态变量）
        bytes32 slot = bytes32(uint256(0));
        
        // 计算存储位置
        return keccak256(abi.encodePacked(key, slot)); // 使用哈希函数计算位置
    }
}
