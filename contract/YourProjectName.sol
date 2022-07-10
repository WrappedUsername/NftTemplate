// SPDX-License-Identifier: MIT
/** 
@custom:dev Please use locked pragma for production to avoid SWC-103
floating pragma i.e. ^0.8.0, using a locked pragma that
has been thoroughly tested with the contract ensures
that contracts do not accidentally get deployed using, for example, 
an outdated compiler version that might introduce bugs that affect 
the contract system negatively. 
Pragma version 0.8.14 necessitates a version too recent to be trusted. 
Consider deploying with 0.6.12/0.7.6/0.8.7, solc-0.8.14 is not recommended for deployment
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
*/
// Locked pragma and not too recent of version. Feel free to remove above info.
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 
/// @title NFT smart contract template.
/// @author WrappedUsername
contract YourProjectName is ERC721, Ownable {
    /** 
    @notice Using for directive, provides counters that can only be incremented, decremented or reset. 
    This can be used e.g. to track the number of elements in a mapping, issuing ERC721 ids, 
    or counting request ids. 
    */
    using Counters for Counters.Counter;
    /** 
    @notice Public state variable of integer value type, assigned in safeMint function
    as tokenId. 
    */
    Counters.Counter public _tokenIdCounter;
    /** 
    @dev Price for "the public" (not owner) safeMint function. Replace with your price for your NFT. 
    This is for ethereum only, this will not work for other blockchains e.g. like Polygon etc. 
    */
    uint256 public price = 0.05 ether; 
    /// @notice Maximum supply is 4000, replace with your maximum supply for your project.
    uint256 public maxSupply = 4000;

    /// @dev Constructor assigns name and symbol. Replace with your NFT project name and symbol. 
    constructor() ERC721("Your Project Name", "YPN") {}

    /**  
    @dev Please check that your json file extensions do not have .json at the end of the file name. 
    Also please ensure that the IPFS hash has the forward slash at the end of hash. 
    e.g. ipfs://IpfshashGoesHereFollowedByTheForwardSlash/ this will return the tokenId at the end
    so the metadata can be found e.g. ipfs://IpfshashGoesHereFollowedByTheForwardSlash/1 <- tokenId.
    */
    function _baseURI() internal pure override returns (string memory) {
        return "/"; // Your art goes here.
    }

    /// @notice Free mint for owner.
    function ownerMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Price to mint for "the public".
    function safeMint(address to) public payable {
        require(msg.value == price, "Please pay .05 ether");
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= maxSupply, "ALl NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Withdraw function for funds deposited into smart contract.
    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
}