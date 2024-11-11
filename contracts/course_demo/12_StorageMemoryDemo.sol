// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageMemoryDemo {
    // 定义storage的数组
    uint256[] public storageArray; // storage 类型的数组，持久存储在区块链上
    
    // storage to storage
    uint256[] storageArray1; // storage 类型
    uint256[] storageArray2; // storage 类型
    constructor() {
        storageArray2 = storageArray1; // storageArray2 引用 storageArray1
    }

    // storage to memory
    function copyFromStorage() external view returns (uint256[] memory) {
        uint256[] memory memoryArray = storageArray; // 创建 storageArray 的副本
        return memoryArray; // 返回副本
    }

    // memory to memory
    function copyMemoryArray(uint256[] memory originalArray) external pure returns (uint256[] memory) {
        uint256[] memory copiedArray = originalArray; // 创建 copiedArray，内容为 originalArray 的副本
        return copiedArray; // 返回复制后的数组
    }

    // memory to storage
    function setStorageArray(uint256[] memory memoryArray) external {
        storageArray = memoryArray; // 将 memoryArray 的内容复制到 storageArray
    }

    // calldata to memory
    function processArray(uint256[] calldata inputArray) external pure returns (uint256) {
        uint256[] memory memoryArray = inputArray; // 将 calldata 数组复制到 memory 数组
        return memoryArray.length; // 返回数组的长度
    }

    // calldata to storage
    function setStorageFromCalldata(uint256[] calldata inputArray) external {
        uint256[] memory memoryArray = new uint256[](inputArray.length);
        for (uint256 i = 0; i < inputArray.length; i++) {
            memoryArray[i] = inputArray[i]; // 从 calldata 复制到 memory
        }
        storageArray = memoryArray; // 将 memory 复制到 storage
    }
}
