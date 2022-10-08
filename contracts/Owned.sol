// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

contract Owned {
    
    address owner; // State variable.

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this operation");
        _;
    }
    receive () external payable {} // Fallback or default function.
}
