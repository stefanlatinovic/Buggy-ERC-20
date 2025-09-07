// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge08} from "../src/Challenge08.sol";

contract Challenge08Test is BaseTest {
    MockChallenge08 private erc20;

    function setUp() public {
        erc20 = new MockChallenge08();
    }

    function test_BurnDoesNotDecreaseTotalSupply() public {
        uint256 totalSupplyBefore = erc20.totalSupply();
        uint256 balanceBefore = erc20.balanceOf(deployer);

        erc20.burn(balanceBefore);

        uint256 balanceAfter = erc20.balanceOf(deployer);
        assertEq(balanceAfter, 0);
        uint256 totalSupplyAfter = erc20.totalSupply();
        assertEq(totalSupplyBefore, totalSupplyAfter);
    }
}

contract MockChallenge08 is Challenge08 {}
