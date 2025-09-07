// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge10} from "../src/Challenge10.sol";

contract Challenge10Test is BaseTest {
    MockChallenge10 private erc20;

    function setUp() public {
        erc20 = new MockChallenge10();
        assertEq(erc20.owner(), deployer);
    }

    function test_AccessControlHasIncorrectImplementation() public {
        vm.startPrank(random);
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.mint(random, amount);
        assertEq(erc20.balanceOf(random), amount);

        erc20.burn(random, amount);
        assertEq(erc20.balanceOf(random), 0);

        erc20.renounceOwnership();
        assertEq(erc20.owner(), address(0));

        erc20.transferOwnership(random);
        assertEq(erc20.owner(), random);
        vm.stopPrank();
    }
}

contract MockChallenge10 is Challenge10 {}
