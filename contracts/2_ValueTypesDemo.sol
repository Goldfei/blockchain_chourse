// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValueTypesDemo {
    /* default value types */
    int public defaultInt;  
    uint public defaultUint;
    bool public defaultBool;
    address public defaultAddress;
    bytes1 public defaultBytes1;

    enum ActionSet { Buy, Hold, Sell }
    ActionSet public defaultEnum;
}
