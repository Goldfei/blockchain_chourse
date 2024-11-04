// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOperationsDemo {
    uint[] public uintArray;

    // 初始化数组
    function initializeArray() public {
        // 清空之前的数组
        delete uintArray;

        // 添加元素
        uintArray.push(1);
        uintArray.push(2);
        uintArray.push(3);
        uintArray.push(4);
        uintArray.push(5);
    }

    // 移除最后一个元素
    function removeLastElement() public {
        require(uintArray.length > 0, "Array is empty, cannot pop.");
        uintArray.pop();
    }

    // 获取当前数组的长度
    function getArrayLength() public view returns (uint) {
        return uintArray.length;
    }
}
