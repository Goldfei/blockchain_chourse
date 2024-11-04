// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayDemo {
    // 固定长度数组
    uint[3] public fixedUintArray;
    bytes1[5] public fixedBytesArray;
    address[2] public fixedAddressArray;

    // 可变长度数组
    uint[] public dynamicUintArray;
    bytes1[] public dynamicBytesArray;
    address[] public dynamicAddressArray;
}
