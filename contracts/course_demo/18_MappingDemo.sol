// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingDemo {
    // id 映射到地址
    mapping(uint => address) public idToAddress;

    // 币对的映射，地址到地址
    mapping(address => address) public swapPair;

    // 添加映射值
    function addMapping(uint id, address addr) public {
        idToAddress[id] = addr;
    }

    function addSwapPair(address tokenA, address tokenB) public {
        swapPair[tokenA] = tokenB;
    }

    // 获取映射值
    function getAddressById(uint id) public view returns (address) {
        return idToAddress[id];
    }

    function getSwapPair(address tokenA) public view returns (address) {
        return swapPair[tokenA];
    }
}
