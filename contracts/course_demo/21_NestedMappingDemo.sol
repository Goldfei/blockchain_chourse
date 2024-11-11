// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedMappingDemo {
    mapping(address => mapping(uint => bool)) public permissions;

    // 设置权限
    function setPermission(address _user, uint _resourceId, bool _hasAccess) public {
        permissions[_user][_resourceId] = _hasAccess;
    }

    // 检查权限
    function hasPermission(address _user, uint _resourceId) public view returns (bool) {
        return permissions[_user][_resourceId];
    }
}