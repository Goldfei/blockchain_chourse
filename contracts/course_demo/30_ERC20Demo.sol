// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20Demo {
    string public name = "FlyToken";        // 代币名称
    string public symbol = "QXTK";          // 代币符号
    uint8 public decimals = 18;            // 小数位
    uint256 public totalSupply;            // 代币总供应量
    mapping(address => uint256) public balanceOf;  // 账户余额
    mapping(address => mapping(address => uint256)) public allowance; // 授权

    // 事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint256(decimals); // 设置初始总供应量
        balanceOf[msg.sender] = totalSupply;  // 将全部代币发送到合约创建者
    }

    // 转账函数
    function transfer(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // 授权函数
    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // 代币转账
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(from != address(0) && to != address(0), "Invalid address");
        require(balanceOf[from] >= amount, "Insufficient balance");
        require(allowance[from][msg.sender] >= amount, "Allowance exceeded");

        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        allowance[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        return true;
    }
}
