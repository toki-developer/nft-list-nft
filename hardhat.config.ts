import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

//dev
const ACCOUNT_PRIVATE_KEY_DEV = process.env.ACCOUNT_PRIVATE_KEY_DEV ?? "";
const ALCHEMY_API_KEY_GOERIL = process.env.ALCHEMY_API_KEY_GOERIL;

//main
const ALCHEMY_API_KEY_MAIN = process.env.ALCHEMY_API_KEY_MAIN;
const ACCOUNT_PRIVATE_KEY_MAIN = process.env.ACCOUNT_PRIVATE_KEY_MAIN ?? "";

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY_GOERIL}`,
      accounts: [ACCOUNT_PRIVATE_KEY_DEV],
    },
    // mainnet: {
    //   url: `https://eth-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY_MAIN}`,
    //   accounts: [ACCOUNT_PRIVATE_KEY_MAIN],
    // },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

export default config;
