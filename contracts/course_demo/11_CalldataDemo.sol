// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataDemo {
    // 使用 memory 修改数组
    function modifyArrayMemory(uint256[] memory arr) public pure returns (uint256[] memory) {
        for (uint256 i = 0; i < arr.length; i++) {
            arr[i] += 1; // 修改每个元素
        }
        return arr; // 返回修改后的数组
    }
    
    // 使用 calldata 尝试修改数组
    function modifyArrayCalldata(uint256[] calldata arr) external pure returns (uint256) {
        // calldata 不可变性
        // for (uint256 i = 0; i < arr.length; i++) {
        //     arr[i] += 1; 
        // }
        return arr.length; // 返回数组长度
    }
}








