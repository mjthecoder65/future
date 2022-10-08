// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.17;

import "./Mortal.sol";

contract Future is Mortal {

    event LogWithdrawFundBeforeReleaseTime(address addr, uint amount, uint balance);
    event LogFundWithdraw(address addr, uint amount, uint balance);
    event LogFundingReceived(address addr, uint amount, uint balance);
    event LogFundDeposited(address addr, uint amount, uint balance);
    event LogAddedUser(address addr,string username, uint amount);
    event LogFundTransfered(address addr, uint amount);

    struct User {
        address payable addr;
        string username;
        uint amount;
    }

    mapping(address => User) private users;

    function addUser(address payable addr, string memory username) payable public onlyOwner {
        users[addr] = User(addr, username, msg.value);
        emit LogAddedUser(addr, username, msg.value);
    }

    function getUser(address addr ) public view returns(User memory) {
        return users[addr];
    }

    function getUserBalance(address addr) public view returns(uint){
        return users[addr].amount;
    }

    function deposit(address addr) payable public {
        require(users[addr].addr == addr, "Account Not Found. Failed to Deposit");
        users[addr].amount += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function canWithdraw(address addr, uint amount) private view returns(bool) {
        if (amount < users[addr].amount) {
            return true;
        }
        else {
            return false;
        }
    }

    function send(address payable to, uint amount) public onlyOwner {
        uint balance = getContractBalance();
        require(balance > amount, "Insufficient Funds");
        to.transfer(amount);
        emit LogFundTransfered(to, amount);
    }
    
    function withdraw(address payable addr, uint amount) payable public onlyOwner{
        require(users[addr].addr == addr, "Only the account owner can withdraw");
        require(canWithdraw(addr, amount) == true, "Insufficient funds");
        users[addr].amount -= amount;
        users[addr].addr.transfer(amount);
        emit LogFundWithdraw(addr, amount, users[addr].amount);
    } 
}
