const { expect } = require("chai");
const { ethers } = require("hardhat");

// Modern javascript
describe("Voxel Helos Smart Contract Tests", () => {
 
  it("Voxel Helos deployed successfully", async () => {
    const VoxelHelos = await ethers.getContractFactory("VoxelHelos"); 
    const voxelHelos = await VoxelHelos.deploy();
    await voxelHelos.deployed();
    console.log("Voxel Helos deployed to:", voxelHelos.address);
  })
})
