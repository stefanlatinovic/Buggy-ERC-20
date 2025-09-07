// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge13} from "../src/Challenge13.sol";

contract Challenge13Test is BaseTest {
    MockChallenge13 private erc20;

    function setUp() public {
        erc20 = new MockChallenge13();
    }

    function test_ApproveIncreasesAllowanceFromSpenderToOwner() public {
        uint256 amount = getTransferAmount(erc20.decimals());

        erc20.approve(spender, amount);

        uint256 ownerToSpenderAllowance = erc20.allowance(deployer, spender);
        assertEq(ownerToSpenderAllowance, 0);
        uint256 spenderToOwnerAllowance = erc20.allowance(spender, deployer);
        assertEq(spenderToOwnerAllowance, amount);
    }
}

contract MockChallenge13 is Challenge13("BuggyToken13", "BUG13", 18) {}
