// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableScopeDemo {
    // 状态变量：存储在区块链上，生命周期与合约相同
    uint256 public stateVariable; // 状态变量

    // 设置状态变量
    function setStateVariable(uint256 value) public {
        stateVariable = value; // 修改状态变量
    }

    // 使用局部变量
    function getLocalVariable() public pure returns (uint256) {
        uint256 localVariable = 10; // 局部变量，仅在此函数有效
        return localVariable; // 返回局部变量的值
    }

    // 使用全局变量
    function getBlockNumber() public view returns (uint256) {
        return block.number; // 使用全局变量访问当前区块号
    }

}
