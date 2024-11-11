// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireDemo {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() public view {
        require(msg.sender == owner, "Not the contract owner");
    }

    function divide(uint a, uint b) public pure returns (uint) {
        require(b != 0, "Division by zero");
        return a / b;
    }
}

