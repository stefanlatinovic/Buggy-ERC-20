// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";

contract BaseTest is Test {
    address internal immutable deployer;

    address internal immutable recipient = makeAddr("recipient");
    address internal immutable spender = makeAddr("spender");
    address internal immutable random = makeAddr("random");

    constructor() {
        deployer = address(this);
    }

    function getTransferAmount(uint8 decimals) internal pure returns (uint256) {
        return 1 * 10 ** decimals;
    }
}
