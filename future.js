const fs  = require('fs')
const Web3 = require('web3');
const config = require("config");

var web3 = new Web3(new Web3.providers.HttpProvider(config.get("ethInfuraURI")));

const CONTRACT_ADDRESS = "0xea5458c2bff5c2c35a19a56c32d56abd6f5f4a55"


function Future(contractAddress) {
    const ABI = JSON.parse(fs.readFileSync("./contracts/abi.json"))
    this.contract = new web3.eth.Contract(ABI, contractAddress)
}

Future.prototype.getContractBalance = async function () {
    const balance = await this.contract.methods.getContractBalance().call()
    return balance;
}

Future.prototype.getUserBalance = async function(address){
    const balance = await this.contract.methods.getUserBalance(address).call()
    return balance;
}

Future.prototype.addUser = async function(address, username) {
    // TODO
}

Future.prototype.send = async function(address, amount) {
    // TODO
}

Future.prototype.deposit = async function(address, amount) {
    // TODO
}

Future.prototype.withdraw = async function(address, amount) {
    // TODO
}


module.exports = new Future(CONTRACT_ADDRESS)



