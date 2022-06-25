async function main() {
    const token = await ethers.getContractFactory("jswitch");
 
    const deploy_token = await token.deploy("0xf5EbBD1d9D8C3CaE824e5912a9E633E6D2B5B9ea", { value: 8000 });
    console.log("Contract deployed to address:", deploy_token.address);

 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });