// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge17} from "../src/Challenge17.sol";

contract Challenge17Test is BaseTest {
    MockChallenge17 private erc20;

    function setUp() public {
        erc20 = new MockChallenge17();
    }

    function test_TransferUpdatesWrongBalances() public {
        uint256 amount = getTransferAmount(erc20.decimals());
        assertGt(erc20.balanceOf(deployer), amount);

        vm.expectRevert("ERC20: transfer amount exceeds balance");
        erc20.transfer(recipient, amount);
    }
}

contract MockChallenge17 is Challenge17 {}
