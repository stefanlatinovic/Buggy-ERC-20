// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge16} from "../src/Challenge16.sol";

contract Challenge16Test is BaseTest {
    MockChallenge16 private erc20;

    function setUp() public {
        erc20 = new MockChallenge16();
    }

    function test_ApproveDoesNotIncreaseAllowance() public {
        uint256 amount = getTransferAmount(erc20.decimals());

        erc20.approve(spender, amount);

        assertEq(erc20.allowance(deployer, spender), 0);
    }
}

contract MockChallenge16 is Challenge16 {}
