async function main() {
    // Deploy Identity Contract
    const Identity = await ethers.getContractFactory("Identity");
    const identity = await Identity.deploy();
    await identity.deployed();
    console.log("Identity Contract deployed to:", identity.address);
  
    // Deploy ZKP Verifier
    const ZKPVerifier = await ethers.getContractFactory("ZKPVerifier");
    const zkpVerifier = await ZKPVerifier.deploy();
    await zkpVerifier.deployed();
    console.log("ZKP Verifier deployed to:", zkpVerifier.address);
  
    // Deploy Governance Contract
    const Governance = await ethers.getContractFactory("PrivacyPreservingGovernance");
    const governance = await Governance.deploy(identity.address, zkpVerifier.address);
    await governance.deployed();
    console.log("Governance Contract deployed to:", governance.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });