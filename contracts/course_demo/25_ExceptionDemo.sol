// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExceptionDemo {
    address public owner;
    uint8 public totalSupply;
    constructor() {
        owner = msg.sender;
        totalSupply = 0;
    }

    // require require(检查条件，"异常的描述")
    function onlyOwner() public view {
        require(msg.sender == owner, "Not the contract owner");
    }
    function divide(uint a, uint b) public pure returns (uint){
        require(b != 0, "Division by Zero");
        return a / b;
    }
    // assert
    function mint(uint8 amount) public {
        totalSupply += amount;
        assert(totalSupply >= amount); // 检查溢出
    }

    // revert
    function withdraw(uint amount, uint balance) public pure {
        if (amount > balance) {
            revert("Insufficient balance");
        }
    }

    error InsufficientBalance(uint requested, uint available);
    uint public balanceA = 100;
    function withdraw(uint amount) public {
        if (amount > balanceA) {
            revert InsufficientBalance(amount, balanceA);
        }
        balanceA -= amount;
    }

}