// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge09} from "../src/Challenge09.sol";

contract Challenge09Test is BaseTest {
    MockChallenge09 private erc20;

    function setUp() public {
        erc20 = new MockChallenge09();
    }

    function test_TransferUnderflowIncreasesBalance() public {
        uint256 balanceBefore = erc20.balanceOf(random);
        assertEq(balanceBefore, 0);

        vm.prank(random);
        erc20.transfer(recipient, 1);

        uint256 balanceAfter = erc20.balanceOf(random);
        assertEq(balanceAfter, type(uint256).max);
    }
}

contract MockChallenge09 is Challenge09 {}
