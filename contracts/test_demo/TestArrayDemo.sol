// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestArrayDemo {
    uint[3] public uintArray;
    function initArray() public {
        for (uint i = 0; i < uintArray.length; i++) 
        {
            uintArray[i] = i*10;
        }
    }

    // 获取数组元素的函数
    function getElement(uint index) public view returns (uint) {
        return uintArray[index];
    }

    // 获取整个数组
    function getArray() public view returns (uint[3] memory) {
        return uintArray;
    }

    // 使用 calldata 作为输入参数，并返回数组的总和
    function sumElements(uint[] calldata arr) external pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }

    // 遍历数组并返回动态数组
    function getSumElements() public view returns (uint) {
        uint[] memory elements = new uint[](uintArray.length);
        for (uint i = 0; i < uintArray.length; i++) {
            elements[i] = uintArray[i];
        }
        return this.sumElements(elements);
    }
}