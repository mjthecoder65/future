// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

import "./Owner.sol";

contract Mortal is Owner {
    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
}