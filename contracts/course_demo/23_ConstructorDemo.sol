// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructorDemo {
    string public name;
    address public owner;
    constructor(string memory _name) {
        owner = msg.sender;
        name = _name;
    }
}