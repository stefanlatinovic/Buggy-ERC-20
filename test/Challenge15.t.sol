// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {INITIAL_MINT_AMOUNT} from "./utils/Constants.t.sol";

import {Challenge15} from "../src/Challenge15.sol";

contract Challenge15Test is BaseTest {
    MockChallenge15 private erc20;

    function setUp() public {
        erc20 = new MockChallenge15();
    }

    function test_MintDoesNotIncreaseRecipientBalance() public {
        assertEq(erc20.totalSupply(), INITIAL_MINT_AMOUNT * 10 ** erc20.decimals());
        assertEq(erc20.balanceOf(deployer), 0);
    }
}

contract MockChallenge15 is Challenge15("BuggyToken15", "BUG15", 18) {
    constructor() {
        _mint(msg.sender, INITIAL_MINT_AMOUNT * 10 ** decimals);
    }
}
