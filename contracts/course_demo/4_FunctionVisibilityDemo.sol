// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionVisibilityDemo {
    uint public publicVar = 100;  // public 变量，可供内外部访问

    // public 函数：合约内外都可以调用
    function setPublicVar(uint _value) public {
        publicVar = _value;
    }

    // external 函数：只能从合约外部调用，内部需通过 this 调用
    function setExternalVar(uint _value) external {
        publicVar = _value;
    }

    // internal 函数：只能在当前合约及子合约中调用
    function setInternalVar(uint _value) internal {
        publicVar = _value;
    }

    // private 函数：只能在当前合约中调用
    function setPrivateVar(uint _value) private {
        publicVar = _value;
    }

    // 内部调用 internal 和 private 函数
    function internalCall() public {
        setInternalVar(200);  // 调用 internal 函数
        setPrivateVar(300);   // 调用 private 函数
    }

    // 通过 this 调用 external 函数
    function callExternalUsingThis() public {
        this.setExternalVar(400);  // 内部调用 external 函数
    }  
}