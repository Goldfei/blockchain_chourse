// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721("My NFT", "MNFT"), Ownable(address(msg.sender)) {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    // Mapping 用于存储每个 tokenId 对应的元数据 CID
    // Mapping 用于存储每个 tokenId 对应的元数据 CID
    mapping(uint256 => string) private _tokenURIs;


    // Mint function: 由合约拥有者调用，铸造新的 NFT
    function safeMint(address to, string memory tokenCID) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(to, tokenId);  // 铸造新代币并赋予指定地址
        _setTokenURI(tokenId, tokenCID);  // 设置对应的 CID
        _tokenIdCounter.increment();  // 更新 tokenId
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
}
