// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageDemo {
    uint256 public number;

    function store(uint256 num) public {
        number = num;
    }
}