// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721("My NFT", "MNFT"),Ownable(address(msg.sender)) {
    uint256 private _tokenIdCounter;
    // Mapping 用于存储每个 tokenId 对应的元数据 CID
    mapping(uint256 => string) private _tokenURIs;
    mapping(uint256 => uint256) private _tokenPrices;

    event TokenMinted(address indexed to, uint256 tokenId);

    // Mint function: 由合约拥有者调用，铸造新的 NFT
    function safeMint(address to, string memory tokenCID) public onlyOwner {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(to, tokenId);  // 铸造新代币并赋予指定地址
        _setTokenURI(tokenId, tokenCID);  // 设置对应的 CID
        _tokenIdCounter++;  // 更新 tokenId

        // 触发 TokenMinted 事件
        emit TokenMinted(to, tokenId);  // 记录铸造 NFT 的事件
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;  // 返回当前铸造的代币总数
    }

    function tokenByIndex(uint256 index) external view returns (uint256) {
        require(index < _tokenIdCounter, "Index out of bounds");
        return index;  // 直接返回 tokenId，因为我们是按顺序铸造的
    }

    function getAllTokens() public view returns (uint256[] memory) {
        uint256[] memory tokenIds = new uint256[](_tokenIdCounter);
        for (uint256 i = 0; i < _tokenIdCounter; i++) {
            tokenIds[i] = i;
        }
        return tokenIds;
    }

    function burn(uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(owner == msg.sender, "You are not the owner");
        _burn(tokenId);
    }


    // 设置每个 tokenId 的元数据 CID Qmag17LwpBeEmq2U6dsiDU5gD8gEwKyBtGggZXz6daFK9L
    function _setTokenURI(uint256 tokenId, string memory tokenCID) internal {
        require(ownerOf(tokenId) != address(0), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = tokenCID;  // 记录 tokenId 与 CID 的映射
    }

    // 重写 tokenURI 函数，根据 tokenId 返回对应的 IPFS 链接
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "ERC721Metadata: URI query for nonexistent token");
        string memory tokenCID = _tokenURIs[tokenId];
        return string(abi.encodePacked("https://ipfs.io/ipfs/", tokenCID));
    }

    // 设置 NFT 的价格
    function setPrice(uint256 tokenId, uint256 price) public {
        require(ownerOf(tokenId) == msg.sender, "Only the owner can set the price");
        _tokenPrices[tokenId] = price;  // 设置该 NFT 的价格
    }

    // 获取 NFT 的价格
    function getPrice(uint256 tokenId) public view returns (uint256) {
        return _tokenPrices[tokenId];
    }
}
