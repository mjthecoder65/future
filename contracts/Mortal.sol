// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

import "./Owned.sol";

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
}