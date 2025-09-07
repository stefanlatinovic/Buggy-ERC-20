// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge18} from "../src/Challenge18.sol";

contract Challenge18Test is BaseTest {
    MockChallenge18 private erc20;

    function setUp() public {
        erc20 = new MockChallenge18();
    }

    function test_MintDoesNotIncreaseTotalSupply() public {
        assertGt(erc20.balanceOf(deployer), 0);
        assertEq(erc20.totalSupply(), 0);
    }
}

contract MockChallenge18 is Challenge18 {}
