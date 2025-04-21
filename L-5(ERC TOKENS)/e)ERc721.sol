// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage {
    uint256 private _tokenIds;

    constructor() ERC721("Dogie", "DOG") {
        _tokenIds = 0; // Initialize counter (optional, as uint256 defaults to 0)
    }

    function mintNFT(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = _tokenIds;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _tokenIds++; // Increment after minting
        return newItemId;
    }

    function getTokenCounter() public view returns (uint256) {
        return _tokenIds;
    }
}
// or simple-


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract myToken is ERC721URIStorage {
     uint256 private _tokenIds;
     constructor() ERC721("Elon Musk", "EMS") {}

     function mintNFT() public returns (uint256) {
          _tokenIds++;
          uint256 newItemId = _tokenIds;
          _mint(msg.sender, newItemId);
          _setTokenURI(newItemId, "https://emerald-slippery-grouse-149.mypinata.cloud/ipfs/bafkreifbezbyuocy477vi4d7lnrog7or6nn5db7oqn4upxqaja5gr5l5ra");

        return newItemId;

     }

}
//0x2099383028CBf25e0FD7870dD637782D28C72C31


nft testing

// const { expect } = require("chai");
// const { ethers } = require("hardhat");

// describe("BasicNft", function () {
//     let BasicNft, basicNft, owner, addr1;
//     const TOKEN_URI = "ipfs://QmTestUri123";

//     beforeEach(async function () {
//         [owner, addr1] = await ethers.getSigners();
//         BasicNft = await ethers.getContractFactory("BasicNft");
//         basicNft = await BasicNft.deploy();
//         await basicNft.waitForDeployment();
//     });

//     it("Should initialize correctly", async function () {
//         expect(await basicNft.name()).to.equal("dogie");
//         expect(await basicNft.symbol()).to.equal("DOG");
//         // Private variables can't be accessed directly, but we can infer s_tokenCounter via minting
//     });

//     it("Should mint an NFT correctly", async function () {
//         // Mint NFT
//         const tx = await basicNft.mintNft(TOKEN_URI);
//         await tx.wait();

//         // Check token counter
//         expect(await basicNft.balanceOf(owner.address)).to.equal(1);
//         // Check ownership
//         expect(await basicNft.ownerOf(0)).to.equal(owner.address);
//         // Check token URI
//         expect(await basicNft.tokenURI(0)).to.equal(TOKEN_URI);
//     });

//     it("Should increment token counter after minting", async function () {
//         // Mint first NFT
//         await basicNft.mintNft(TOKEN_URI);
//         // Mint second NFT
//         await basicNft.mintNft("ipfs://QmTestUri456");
//         // Check balance (2 NFTs owned by owner)
//         expect(await basicNft.balanceOf(owner.address)).to.equal(2);
//         // Check second token's URI
//         expect(await basicNft.tokenURI(1)).to.equal("ipfs://QmTestUri456");
//     });

//     it("Should allow minting to another address", async function () {
//         // Mint NFT to addr1
//         await basicNft.connect(addr1).mintNft(TOKEN_URI);
//         expect(await basicNft.balanceOf(addr1.address)).to.equal(1);
//         expect(await basicNft.ownerOf(0)).to.equal(addr1.address);
//         expect(await basicNft.tokenURI(0)).to.equal(TOKEN_URI);
//     });

//     it("Should return correct tokenURI", async function () {
//         // Mint NFT
//         await basicNft.mintNft(TOKEN_URI);
//         expect(await basicNft.tokenURI(0)).to.equal(TOKEN_URI);
//     });

// //     it("Should revert tokenURI for non-existent token", async function () {
// //      // No NFTs minted, tokenId 0 doesn't exist
// //      await expect(basicNft.tokenURI(0)).to.be.revertedWith("ERC721: URI query for nonexistent token");

// //      // Mint one NFT, tokenId 1 doesn't exist
// //      await basicNft.mintNft(TOKEN_URI);
// //      await expect(basicNft.tokenURI(1)).to.be.revertedWith("ERC721: URI query for nonexistent token");
// //  });

//     it("Should emit Transfer event on mint", async function () {
//         await expect(basicNft.mintNft(TOKEN_URI))
//             .to.emit(basicNft, "Transfer")
//             .withArgs(ethers.ZeroAddress, owner.address, 0);
//     });
// });