// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

import "./Owned";

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
}