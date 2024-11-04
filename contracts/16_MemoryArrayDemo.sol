// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryArrayDemo {
    function createMemoryArray() public pure returns (uint[] memory, bytes memory) {
        // 创建长度为 5 的 memory 动态 uint 数组
        uint[] memory memoryUintArray = new uint[](5); // 正确声明和初始化

        // 创建长度为 9 的 bytes 数组
        bytes memory memoryBytesArray = new bytes(9); 

        // 初始化 uint 数组
        for (uint i = 0; i < memoryUintArray.length; i++) {
            memoryUintArray[i] = i + 1; // 将元素设置为 1, 2, 3, 4, 5
        }

        // 初始化 bytes 数组
        for (uint j = 0; j < memoryBytesArray.length; j++) {
            memoryBytesArray[j] = bytes1(uint8(j + 65)); // 将元素设置为 ASCII 字符 'A' 到 'I'
        }

        // 返回数组
        return (memoryUintArray, memoryBytesArray);
    }

    function bytesToString(bytes memory b) public pure returns (string memory) {
        return string(b);
    }
}
