// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

contract Identity is ERC165 {
    // Data structure for identity claims
    struct Claim {
        uint256 topic;
        uint256 scheme;
        address issuer;
        bytes signature;
        bytes data;
        string uri;
    }

    // Mapping of claim topics to claims
    mapping(bytes32 => Claim) private claims;
    
    // Identity owner
    address public owner;
    
    // Events
    event ClaimAdded(
        bytes32 indexed claimId,
        uint256 indexed topic,
        uint256 scheme,
        address indexed issuer
    );
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    // Add a new claim
    function addClaim(
        uint256 _topic,
        uint256 _scheme,
        address _issuer,
        bytes memory _signature,
        bytes memory _data,
        string memory _uri
    ) public onlyOwner returns (bytes32 claimId) {
        claimId = keccak256(abi.encode(_topic, _scheme, _issuer));
        
        claims[claimId] = Claim(
            _topic,
            _scheme,
            _issuer,
            _signature,
            _data,
            _uri
        );
        
        emit ClaimAdded(claimId, _topic, _scheme, _issuer);
    }
    
    // Get claim data
    function getClaim(bytes32 _claimId) public view returns (
        uint256 topic,
        uint256 scheme,
        address issuer,
        bytes memory signature,
        bytes memory data,
        string memory uri
    ) {
        Claim memory claim = claims[_claimId];
        return (
            claim.topic,
            claim.scheme,
            claim.issuer,
            claim.signature,
            claim.data,
            claim.uri
        );
    }
    
    // Verify if a claim exists
    function hasValidClaim(uint256 _topic, address _issuer) public view returns (bool) {
        bytes32 claimId = keccak256(abi.encode(_topic, _issuer));
        return claims[claimId].issuer == _issuer;
    }
}