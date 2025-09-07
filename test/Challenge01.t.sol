// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {INITIAL_MINT_AMOUNT} from "./utils/Constants.t.sol";

import {Challenge01} from "../src/Challenge01.sol";

contract Challenge01Test is BaseTest {
    MockChallenge01 private erc20;

    function setUp() public {
        erc20 = new MockChallenge01();
    }

    function test_TransferDoesNotDeductFromBalance() public {
        uint256 balanceFromBefore = erc20.balanceOf(deployer);
        uint256 amount = getTransferAmount(erc20.decimals());

        erc20.transfer(recipient, amount);

        uint256 balanceFromAfter = erc20.balanceOf(deployer);
        assertEq(erc20.balanceOf(recipient), amount);
        assertEq(balanceFromBefore, balanceFromAfter);
    }
}

contract MockChallenge01 is Challenge01("BuggyToken01", "BUG01") {
    constructor() {
        _mint(msg.sender, INITIAL_MINT_AMOUNT * 10 ** decimals());
    }
}
