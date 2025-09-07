// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {INITIAL_MINT_AMOUNT} from "./utils/Constants.t.sol";

import {Challenge20} from "../src/Challenge20.sol";

contract Challenge20Test is BaseTest {
    MockChallenge20 private erc20;

    function setUp() public {
        erc20 = new MockChallenge20();
    }

    function test_TransferFromIncreasesInsteadOfDecreasesAllowance() public {
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.approve(spender, amount);
        uint256 allowanceBefore = erc20.allowance(deployer, spender);
        assertEq(allowanceBefore, amount);

        vm.prank(spender);
        erc20.transferFrom(deployer, recipient, amount);

        uint256 allowanceAfter = erc20.allowance(deployer, spender);
        assertEq(allowanceAfter, allowanceBefore * 2);
    }
}

contract MockChallenge20 is Challenge20("BuggyToken20", "BUG20", 18) {
    constructor() {
        _mint(msg.sender, INITIAL_MINT_AMOUNT * 10 ** decimals);
    }
}
