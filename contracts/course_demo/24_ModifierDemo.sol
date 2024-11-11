// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierDemo {
    address public owner;

    // 构造函数，设置合约的所有者
    constructor() {
        owner = msg.sender;
    }

    // 定义一个修饰器，用于检查调用者是否为合约所有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // 仅限合约所有者调用的函数
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}