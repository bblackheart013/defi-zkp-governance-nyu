// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Identity.sol";
import "./ZKPVerifier.sol";

contract PrivacyPreservingGovernance {
    // State variables
    Identity public identityContract;
    ZKPVerifier public zkpVerifier;
    
    struct Proposal {
        bytes32 proposalHash;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 endTime;
        bool executed;
        mapping(bytes32 => bool) nullifierUsed;
    }
    
    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;
    
    // Events
    event ProposalCreated(uint256 indexed proposalId, bytes32 proposalHash);
    event VoteCast(uint256 indexed proposalId, bytes32 nullifier);
    
    constructor(address _identityContract, address _zkpVerifier) {
        identityContract = Identity(_identityContract);
        zkpVerifier = ZKPVerifier(_zkpVerifier);
    }
    
    // Create a new proposal
    function createProposal(
        bytes32 _proposalHash,
        uint256 _votingPeriod
    ) external returns (uint256) {
        uint256 proposalId = proposalCount++;
        
        Proposal storage proposal = proposals[proposalId];
        proposal.proposalHash = _proposalHash;
        proposal.endTime = block.timestamp + _votingPeriod;
        
        emit ProposalCreated(proposalId, _proposalHash);
        return proposalId;
    }
    
    // Cast a vote using ZKP
    function castVote(
        uint256 _proposalId,
        bool _support,
        bytes calldata _proof,
        bytes32 _nullifier
    ) external {
        Proposal storage proposal = proposals[_proposalId];
        
        require(block.timestamp < proposal.endTime, "Voting period ended");
        require(!proposal.nullifierUsed[_nullifier], "Vote already cast");
        
        // Verify the vote using ZKP
        require(
            zkpVerifier.verifyVoteEligibility(
                _proof,
                _nullifier,
                keccak256(abi.encodePacked(_proposalId, _support))
            ),
            "Invalid vote proof"
        );
        
        // Record the vote
        proposal.nullifierUsed[_nullifier] = true;
        if (_support) {
            proposal.votesFor += 1;
        } else {
            proposal.votesAgainst += 1;
        }
        
        emit VoteCast(_proposalId, _nullifier);
    }
    
    // Get proposal results
    function getProposalResults(uint256 _proposalId)
        external
        view
        returns (
            uint256 votesFor,
            uint256 votesAgainst,
            bool executed,
            uint256 endTime
        )
    {
        Proposal storage proposal = proposals[_proposalId];
        return (
            proposal.votesFor,
            proposal.votesAgainst,
            proposal.executed,
            proposal.endTime
        );
    }
}