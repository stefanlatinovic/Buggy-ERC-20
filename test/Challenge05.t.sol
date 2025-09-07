// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge05} from "../src/Challenge05.sol";

contract Challenge05Test is BaseTest {
    MockChallenge05 private erc20;

    function setUp() public {
        erc20 = new MockChallenge05();
    }

    function test_TransferFromDeductsFromRecipientInsteadOfSender() public {
        uint256 balanceBefore = erc20.balanceOf(deployer);
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.transfer(recipient, amount);
        assertEq(erc20.balanceOf(recipient), amount);
        assertLt(erc20.balanceOf(deployer), balanceBefore);
        erc20.approve(spender, amount);

        vm.prank(spender);
        erc20.transferFrom(deployer, recipient, amount);

        assertEq(erc20.balanceOf(deployer), balanceBefore);
        assertEq(erc20.balanceOf(recipient), 0);
    }
}

contract MockChallenge05 is Challenge05 {}
