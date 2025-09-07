// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge11} from "../src/Challenge11.sol";

contract Challenge11Test is BaseTest {
    MockChallenge11 private erc20;

    function setUp() public {
        erc20 = new MockChallenge11();
    }

    function test_TransferFromDecreasesSpenderInsteadOfOwnerAllowance() public {
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.approve(spender, amount);
        uint256 allowanceBefore = erc20.allowance(deployer, spender);
        assertEq(allowanceBefore, amount);

        vm.prank(spender);
        erc20.transferFrom(deployer, recipient, amount);

        uint256 allowanceAfter = erc20.allowance(deployer, spender);
        assertEq(erc20.allowance(spender, deployer), allowanceBefore - amount);
        assertEq(allowanceBefore, allowanceAfter);
    }
}

contract MockChallenge11 is Challenge11 {}
