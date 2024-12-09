// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./UniversalPoints.sol";
import "./RegularPoints.sol";

contract PointsExchange {
    UniversalPoints public universalPoints;
    
    // 兑换比例映射: key是普通积分的合约地址，value是该普通积分和通用积分之间的兑换比例
    mapping(address => uint256) public exchangeRates;

    // 构造函数：传入通用积分（UPT）的合约地址
    constructor(address _universalPoints) {
        universalPoints = UniversalPoints(_universalPoints);
    }

    // 兑换普通积分为通用积分
    function exchangeRPTToUPT(address regularPointsAddress, uint256 amount) external {
        RegularPoints regularPoints = RegularPoints(regularPointsAddress);
        
        uint256 rate = exchangeRates[regularPointsAddress];
        require(rate > 0, "Exchange rate not set for this token");

        uint256 amountToMint = amount * rate;
        require(regularPoints.balanceOf(msg.sender) >= amount, "Insufficient RPT balance");
        
        // 从用户账户转移普通积分（RPT）
        regularPoints.transferFrom(msg.sender, address(this), amount);

        // 转移通用积分（UPT）
        universalPoints.transfer(msg.sender, amountToMint);
    }

    // 设置不同积分的兑换比例（例如：1 RPT = 0.5 UPT）
    function setExchangeRate(address regularPointsAddress, uint256 newRate) external {
        exchangeRates[regularPointsAddress] = newRate;
    }
}
