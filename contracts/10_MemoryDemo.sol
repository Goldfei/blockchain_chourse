// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryDemo {
    // 使用 memory 存储临时字符串
    function concatenate(string memory a, string memory b) public pure returns (string memory) {
    // 使用 memory 中的临时变量
        return string(abi.encodePacked(a, b)); // 返回拼接后的字符串，使用 memory 修饰
    }
    
    // 处理数组
    function sumArray(uint256[] memory arr) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum; // 返回总和，结果也在 memory 中
    }
}