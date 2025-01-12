# DeFi ZKP Governance

A privacy-preserving governance system for DeFi protocols using Zero-Knowledge Proofs (ZKP).

## Overview

This project implements a decentralized governance system that allows token holders to participate in voting while maintaining privacy through zero-knowledge proofs. The system uses identity verification and ZKP verification to ensure only eligible participants can vote while keeping their voting choices private.

## Features

- Privacy-preserving voting using ZKPs
- Identity verification system
- On-chain governance proposals
- Secure vote verification
- Anonymous vote casting
- Sybil resistance through ZK identity proofs
- EIP-712 compliant signatures
- Gas-optimized voting mechanisms

## Prerequisites

- Node.js >= 18
- npm or yarn
- Hardhat
- Circom (for ZKP circuit compilation)
- Solidity ^0.8.19

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/defi-zkp-governance.git
cd defi-zkp-governance
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment:
```bash
cp .env.example .env
# Configure your environment variables
```

## Project Structure

```
defi-zkp-governance/
├── README.md
├── circuits/                # ZKP circuits
│   ├── pot12_0000.ptau     # Powers of Tau files
│   ├── pot12_0001.ptau
│   ├── pot12_final.ptau
│   └── vote.circom         # Voting circuit implementation
├── contracts/              # Smart contracts
│   ├── Identity.sol        # Identity verification contract
│   ├── Lock.sol           # Basic locking mechanism contract
│   ├── PrivacyPreservingDeFiGovernance.sol
│   ├── PrivacyPreservingGovernance.sol
│   └── ZKPVerifier.sol    # ZKP verification contract
├── ignition/              # Hardhat Ignition deployment
│   └── modules/
│       └── Lock.js        # Lock contract deployment module
├── scripts/               # Deployment and utility scripts
│   └── deploy.js         # Main deployment script
├── test/                 # Test files
│   ├── Governance.test.js
│   └── Lock.js          # Lock contract tests
├── hardhat.config.js     # Hardhat configuration
├── package.json          # Project dependencies
└── package-lock.json     # Locked dependencies
```

### Key Components

1. **Circuits/**
   - Contains Circom circuit implementations
   - Powers of Tau ceremony files
   - Main voting circuit in `vote.circom`

2. **Contracts/**
   - Core smart contract implementations
   - Multiple governance contract variants
   - Identity and verification systems

3. **Test/**
   - Comprehensive test suites
   - Governance and Lock contract tests

4. **Ignition/**
   - Hardhat Ignition deployment modules
   - Structured deployment configurations

5. **Scripts/**
   - Deployment and maintenance scripts

## Technical Architecture

### Zero-Knowledge Proof System
- Uses Groth16 proving system
- Circuit implementation in Circom 2.0
- Efficient on-chain verification
- Proof generation in browser using WebAssembly

### Smart Contract Architecture
- Modular design pattern
- Upgradeable proxy pattern support
- Gas-optimized storage layout
- EIP-712 structured data hashing
- OpenZeppelin security standards

### Identity System
- Sybil-resistant identity verification
- Privacy-preserving membership proofs
- Revocation support
- Hierarchical identity management

## Development

1. Compile contracts:
```bash
npx hardhat compile
```

2. Compile ZKP circuits:
```bash
npm run compile:circuits
```

3. Run tests:
```bash
npx hardhat test
```

4. Deploy contracts:
```bash
npx hardhat run scripts/deploy.js
```

## Testing

The project includes comprehensive tests:

```bash
# Run all tests
npm test

# Run specific test suite
npx hardhat test test/Governance.test.js

# Run tests with gas reporting
REPORT_GAS=true npx hardhat test

# Run coverage analysis
npx hardhat coverage
```

## Deployment

### Local Development
```bash
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```

### Test Networks
```bash
npx hardhat run scripts/deploy.js --network sepolia
```

### Production
```bash
npx hardhat run scripts/deploy.js --network mainnet
```

## Security Considerations

- All contracts follow Checks-Effects-Interactions pattern
- Reentrancy guards implemented
- Integer overflow protection
- Access control implementation
- Timelock mechanisms for critical operations
- Emergency pause functionality

## Performance Optimizations

- Optimized storage layout
- Batch processing support
- Gas-efficient vote aggregation
- Minimal on-chain storage
- Efficient proof verification

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## Dependencies

- `@nomicfoundation/hardhat-toolbox`: ^5.0.0
- `@openzeppelin/contracts`: ^4.9.6
- `ethers`: ^6.1.0
- `hardhat`: ^2.19.0
- `circomlib`: ^2.0.5
- `snarkjs`: ^0.7.5

## Security

This project is in development and has not been audited. Use at your own risk.

## Support

For support, please open an issue in the repository.

## Acknowledgments

- OpenZeppelin for secure contract implementations
- Circom team for ZKP circuit compiler
- Hardhat team for development environment
