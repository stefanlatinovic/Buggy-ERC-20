// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge04} from "../src/Challenge04.sol";

contract Challenge04Test is BaseTest {
    MockChallenge04 private erc20;

    function setUp() public {
        erc20 = new MockChallenge04();
    }

    function test_TransferFromIgnoresPausedState() public {
        erc20.pause();
        assertTrue(erc20.paused());
        uint256 amount = erc20.balanceOf(deployer);
        erc20.approve(spender, amount);

        vm.prank(spender);
        erc20.transferFrom(deployer, recipient, amount);

        assertEq(erc20.balanceOf(deployer), 0);
        assertEq(erc20.balanceOf(recipient), amount);
    }
}

contract MockChallenge04 is Challenge04 {}
