const { expect } = require("chai");
const { ethers } = require("hardhat");

// Modern javascript, replace Your Project Name with your porject name!
describe("Your Project Name Contract Tests", () => {
 
  it("Your Project Name deployed successfully", async () => {
    const YourProjectName = await ethers.getContractFactory("YourProjectName"); 
    const yourProjectName = await YourProjectName.deploy();
    await yourProjectName.deployed();
    console.log("Your Project Name deployed to:", yourProjectName.address);
  })
})
