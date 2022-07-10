const { ethers } = require("hardhat");

// Modern javascript, replace Your Project Name with your porject name!
const main = async () => {
  const YourProjectName = await ethers.getContractFactory("YourProjectName"); 
  const yourProjectName = await YourProjectName.deploy();
  await yourProjectName.deployed();

  console.log("Your Project Name deployed to:", yourProjectName.address);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });