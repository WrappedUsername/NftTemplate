const { ethers } = require("hardhat");

// new javascript
const main = async () => {
  const VoxelHelos = await ethers.getContractFactory("VoxelHelos"); 
  const voxelHelos = await VoxelHelos.deploy();
  await voxelHelos.deployed();

  console.log("Voxel Helos deployed to:", voxelHelos.address);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });