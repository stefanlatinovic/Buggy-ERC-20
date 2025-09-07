// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge07} from "../src/Challenge07.sol";

contract Challenge07Test is BaseTest {
    MockChallenge07 private erc20;

    function setUp() public {
        erc20 = new MockChallenge07();
    }

    function test_MintAllowsUnrestrictedMinting() public {
        uint256 amount = getTransferAmount(erc20.decimals());

        vm.prank(random);
        erc20.mint(random, amount);

        assertEq(erc20.balanceOf(random), amount);
    }
}

contract MockChallenge07 is Challenge07 {}
