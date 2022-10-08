// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

contract Owner {
    
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this operation");
        _;
    }

    function changeOwner(address addr) public onlyOwner {
        owner = addr;
    }

    function getOwner() external view returns(address) {
        return owner;
    }
    
    receive () external payable {} 
}