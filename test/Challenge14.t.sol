// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {INITIAL_MINT_AMOUNT} from "./utils/Constants.t.sol";

import {Challenge14} from "../src/Challenge14.sol";

contract Challenge14Test is BaseTest {
    MockChallenge14 private erc20;

    function setUp() public {
        erc20 = new MockChallenge14();
    }

    function test_TransferFromDeductsAllowanceOnlyForInfiniteApproval() public {
        uint256 amount = getTransferAmount(erc20.decimals());
        erc20.approve(spender, amount);
        uint256 allowanceBefore = erc20.allowance(deployer, spender);
        assertEq(allowanceBefore, amount);

        vm.prank(spender);
        erc20.transferFrom(deployer, recipient, amount);

        uint256 allowanceAfter = erc20.allowance(deployer, spender);
        assertEq(allowanceAfter, allowanceBefore);
    }
}

contract MockChallenge14 is Challenge14("BuggyToken14", "BUG14", 18) {
    constructor() {
        _mint(msg.sender, INITIAL_MINT_AMOUNT * 10 ** decimals);
    }
}
