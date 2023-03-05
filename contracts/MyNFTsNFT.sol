// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";


contract MyNFTsNFT is ERC721, Ownable {

    uint256 private _nextTokenId = 1;
    constructor() ERC721("MyNFTsNFT", "MYNFT") {}

    function buildImage(uint256 tokenId) public view returns(string memory) {
        address nftOwner = ownerOf(tokenId);
        return Base64.encode(bytes(abi.encodePacked(
            '<svg width="600" height="600" xmlns="http://www.w3.org/2000/svg">',
            nftOwner,
            '</svg>'
        )));
    }

     function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
        require(_exists(tokenId), "URI query for nonexistent token");

        return string(
            abi.encodePacked(
                'data:application/json;base64,',
                Base64.encode(bytes(abi.encodePacked(
                    '{"name":"My NFTs NFT #',  Strings.toString(tokenId),'","description": "You can see your NFTs.","image": "data:image/svg;base64,',buildImage(tokenId),'"}')))
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
