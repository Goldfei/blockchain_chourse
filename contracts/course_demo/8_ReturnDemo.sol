// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReturnDemo {
        // 返回单个变量
    function returnNumber() public pure returns(uint256){
        return 6;
    }
    // 返回多个变量
    function returnMultiple() public pure returns(uint256, bool){
        return(1, true);
    }
    // 命名式返回,当为返回变量赋值时，可以省略 return 语句，函数会自动返回这些值
    function returnNamedValues() public pure returns(uint256 x, uint256 y){
        x = 10;
        y = 20;
    }
    // 使用解构赋值从 getValues() 函数获取返回值
    function useValues() public pure returns (uint256, bool) {
        (uint256 myNumber, bool myBool) = returnMultiple();
        return (myNumber, myBool);  // 返回获取的值
    }
    // 只接收部分返回值
    function usePartialValues() public pure returns (uint256) {
        (uint256 myNumber, ) = returnMultiple();    // 只解构第一个值
        return myNumber;
    }
}