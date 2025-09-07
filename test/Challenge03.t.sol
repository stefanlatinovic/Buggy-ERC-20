// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge03} from "../src/Challenge03.sol";

contract Challenge03Test is BaseTest {
    MockChallenge03 private erc20;

    function setUp() public {
        erc20 = new MockChallenge03();
    }

    function test_BurnAllowsBurningOthersTokens() public {
        uint256 balanceBefore = erc20.balanceOf(deployer);

        vm.prank(random);
        erc20.burn(deployer, balanceBefore);

        uint256 balanceAfter = erc20.balanceOf(deployer);
        assertEq(balanceAfter, 0);
    }
}

contract MockChallenge03 is Challenge03 {}
