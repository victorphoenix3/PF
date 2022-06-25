/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config();
// require("@openzeppelin/contracts")
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-ethers")

const { API_URL, PRIVATE_KEY, etherscanKey } = process.env;

module.exports = {
   solidity: "0.8.9",
   defaultNetwork: "goerli",
   networks: {
      hardhat: {},
      goerli: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      },
   },
   etherscan: {
      apiKey: etherscanKey,
   },
}