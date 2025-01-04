# DeFi ZKP Governance System for Digital Democracy 🔐

A privacy-focused decentralized governance platform that integrates Zero-Knowledge Proofs (ZKPs) and ERC-725 identity standards for maintaining digital democracy in DeFi without compromising personal data.

## 📝 Project Overview

This project implements a decentralized governance system that enables:
- Privacy-preserving voting through ZKPs
- Self-sovereign identity management via ERC-725
- Transparent proposal management without revealing voter identities

## 🛠️ VS Code Setup

### Required Extensions
1. **Solidity**
   - Name: `solidity`
   - Publisher: Nomic Foundation
   - Purpose: Smart contract development

2. **Hardhat for VS Code**
   - Purpose: Ethereum development environment support

3. **ESLint**
   - Purpose: JavaScript code linting

4. **Prettier**
   - Purpose: Code formatting

### Workspace Settings
```json
{
  "editor.formatOnSave": true,
  "solidity.compileUsingRemoteVersion": "v0.8.28",
  "editor.defaultFormatter": "esbenp.prettier-vscode"
}
```

## 📁 Project Structure

```
defi-zkp-governance/
├── contracts/                 # Smart Contracts
│   ├── IdentityRegistry.sol   # ERC-725 Implementation
│   ├── ZKPVerifier.sol        # Zero-knowledge Proof Verification
│   └── PrivateGovernance.sol  # Main Governance Logic
├── circuits/                  # ZKP Circuits
│   └── vote.circom           # Voting Circuit
├── frontend/                  # Frontend Application
│   ├── src/
│   │   ├── App.jsx
│   │   └── main.jsx
│   └── index.html
├── scripts/                   # Deployment Scripts
└── test/                     # Test Files
```

## 🚀 Development Setup

1. **Install Dependencies**
```bash
# Install project dependencies
npm install

# Install frontend dependencies
cd frontend && npm install
```

2. **Configure Environment**
Create `.env` file:
```env
PRIVATE_KEY=your_private_key
INFURA_PROJECT_ID=your_infura_id
```

3. **Compile Contracts**
```bash
npx hardhat compile
```

4. **Run Local Network**
```bash
npx hardhat node
```

5. **Deploy Contracts**
```bash
npx hardhat run scripts/deploy.js --network localhost
```

## 🧪 Testing

```bash
# Run all tests
npx hardhat test

# Run specific test
npx hardhat test test/Governance.test.js
```

## 🔍 Core Components

### Smart Contracts
- `IdentityRegistry.sol`: Manages user identities using ERC-725
- `ZKPVerifier.sol`: Handles zero-knowledge proof verification
- `PrivateGovernance.sol`: Implements core governance functionality

### Frontend
- React components for user interaction
- Web3 integration for blockchain interaction
- Chakra UI for responsive design

## 🔒 Privacy Features

1. **Zero-Knowledge Proofs**
   - Enables vote verification without revealing voter identity
   - Maintains transaction privacy

2. **Identity Management**
   - ERC-725 based self-sovereign identity
   - Private credential verification

3. **Vote Privacy**
   - Anonymous voting mechanism
   - Proof validation without data exposure

## 🎯 Implementation Details

### Contract Deployment
```javascript
// Example deployment script
const main = async () => {
  const IdentityRegistry = await ethers.getContractFactory("IdentityRegistry");
  const identityRegistry = await IdentityRegistry.deploy();
  await identityRegistry.deployed();
  console.log("IdentityRegistry deployed to:", identityRegistry.address);
};
```

### Frontend Integration
```javascript
// Example React component
const VotingComponent = () => {
  const castVote = async (proposalId, vote) => {
    const proof = await generateZKProof(vote);
    await contract.castVote(proposalId, proof);
  };
};
```

## 📚 Resources

- [Hardhat Documentation](https://hardhat.org/getting-started/)
- [ERC-725 Standard](https://eips.ethereum.org/EIPS/eip-725)
- [Zero-Knowledge Proofs](https://zkp.science/)

## 👥 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

---
Developed with ❤️ for NYU Project
