// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge12} from "../src/Challenge12.sol";

contract Challenge12Test is BaseTest {
    MockChallenge12 private erc20;

    function setUp() public {
        erc20 = new MockChallenge12();
    }

    function test_GiftDoesNotIncreaseTotalSupply() public {
        uint256 totalSupplyBefore = erc20.totalSupply();
        uint256 amount = getTransferAmount(erc20.decimals());

        erc20.gift(recipient, amount);

        uint256 totalSupplyAfter = erc20.totalSupply();
        assertEq(totalSupplyBefore, totalSupplyAfter);
    }
}

contract MockChallenge12 is Challenge12("BuggyToken12", "BUG12", 18) {}
