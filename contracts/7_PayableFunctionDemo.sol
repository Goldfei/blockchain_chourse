// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableFunctionDemo {
    // 存入合约的总余额
    uint public totalBalance;

    // 允许用户向合约发送 Ether 的 payable 函数
    function deposit() public payable {
        totalBalance += msg.value;  // 更新余额
    }

    // 查询合约当前的 Ether 余额
    function getBalance() public view returns (uint) {
        return address(this).balance;  // 返回合约地址的余额
    }

    // 提取 Ether 到调用者的地址
    function withdraw(uint amount) public {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(msg.sender).transfer(amount);  // 转账到调用者地址
    }
}
