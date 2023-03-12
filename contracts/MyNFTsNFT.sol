// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "hardhat/console.sol";


contract MyWalletStatsNFT is ERC721, Ownable {

    uint256 private _nextTokenId = 1;
    constructor() ERC721("MyWalletStatsNFT", "MWS") {}

     function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
        require(_exists(tokenId), "URI query for nonexistent token");
        address nftOwner = ownerOf(tokenId);

        return string(
            abi.encodePacked(
                'data:application/json;base64,',
                Base64.encode(bytes(abi.encodePacked(
                    '{"name":"My Wallet Stats NFT #',  Strings.toString(tokenId),'","description": "You can see your Wallet Stats","image": "https://arweave.net/PqpMKrJeoRsSYKRfZqf4LJIGuNPGKuaw0BnujQUhqv0", "animation_url": "https://arweave.net/qU74eQtswIItLQtK0xJkFSl5RVusKqBrMx2QGGIAzZw?address=',Strings.toHexString(uint256(uint160(nftOwner))),'"}')))
            )
        );
    }

    function mint() external payable {
        uint256 tokenId = _nextTokenId;
        _nextTokenId ++;
        _mint(_msgSender(), tokenId);
    }

    function withdrawETH() external {
        Address.sendValue(payable(0x5F41399c946FfdED08e92F6971317530858C713B), address(this).balance);
    }
}
