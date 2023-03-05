import { ethers } from "hardhat";

async function main() {
  const Token = await ethers.getContractFactory("MyNFTsNFT").catch((e) => {
    console.log("getContractFactory error");
    console.error(e);
    return undefined;
  });
  if (!Token) return;

  console.log("【LOG】Deploy Start");
  const token = await Token.deploy().catch((e) => {
    console.log("Deploy error");
    console.error(e);
    return undefined;
  });
  if (!token) return;
  console.log(`【LOG】TX: ${token.deployTransaction.hash}`);
  await token.deployed();
  console.log("【LOG】Deploy end");
  console.log(`【LOG】NFT deployed to ${token.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
