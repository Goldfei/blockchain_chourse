// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestReceiveDemo {
    event Received(address sender, uint amount);
    // receive 函数
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    event FallbackCalled(address sender, uint amount, bytes data);

    // fallback 函数
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
}
