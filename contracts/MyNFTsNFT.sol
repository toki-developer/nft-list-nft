// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "hardhat/console.sol";


contract MyNFTsNFT is ERC721, Ownable {

    uint256 private _nextTokenId = 1;
    constructor() ERC721("MyNFTsNFT", "MYNFT") {}

     function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
        require(_exists(tokenId), "URI query for nonexistent token");
        address nftOwner = ownerOf(tokenId);

        return string(
            abi.encodePacked(
                'data:application/json;base64,',
                Base64.encode(bytes(abi.encodePacked(
                    '{"name":"My NFTs NFT #',  Strings.toString(tokenId),'","description": "You can see your NFTs.","image": "https://gr2v2wtpgux5jwj5aq6vwu5iaoxv5vub5fihr5ul3irmp3rvie7a.arweave.net/NHVdWm81L9TZPQQ9W1OoA69e1oHpUHj2i9oix-41QT4", "animation_url": "https://arweave.net/6rzPT_WuZxY_BG8bwk28eOKXbQflmsXcquus-uUt4TU?nft-owner=',Strings.toHexString(uint256(uint160(nftOwner))),'"}')))
            )
        );
    }

    function mint() external payable {
        uint256 tokenId = _nextTokenId;
        _nextTokenId ++;
        _safeMint(_msgSender(), tokenId);
    }

    function withdrawETH() external onlyOwner {
        Address.sendValue(payable(0x5F41399c946FfdED08e92F6971317530858C713B), address(this).balance);
    }
}
