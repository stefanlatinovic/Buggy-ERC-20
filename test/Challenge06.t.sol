// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge06} from "../src/Challenge06.sol";

contract Challenge06Test is BaseTest {
    MockChallenge06 private erc20;

    function setUp() public {
        erc20 = new MockChallenge06();
    }

    function test_TransferFromAllowsBlacklistedTransfers() public {
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.transfer(random, amount);
        assertEq(erc20.balanceOf(random), amount);
        erc20.addToBlacklist(random);
        assertTrue(erc20.blacklist(random));

        vm.startPrank(random);
        vm.expectRevert("Sender or receiver blacklisted");
        erc20.transfer(recipient, amount);
        erc20.approve(spender, amount);
        vm.stopPrank();

        vm.prank(spender);
        erc20.transferFrom(random, recipient, amount);

        assertEq(erc20.balanceOf(random), 0);
        assertEq(erc20.balanceOf(recipient), amount);
    }
}

contract MockChallenge06 is Challenge06 {}
