// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {INITIAL_MINT_AMOUNT} from "./utils/Constants.t.sol";

import {Challenge02} from "../src/Challenge02.sol";

contract Challenge02Test is BaseTest {
    MockChallenge02 private erc20;

    function setUp() public {
        erc20 = new MockChallenge02();
    }

    function test_ApproveHasIncorrectFunctionSignature() public {
        uint256 amount = getTransferAmount(erc20.decimals());

        (bool ok,) =
            address(erc20).call(abi.encodeWithSignature("approve(address,uint256) returns (bool)", spender, amount));

        assertFalse(ok);
    }
}

contract MockChallenge02 is Challenge02("Challenge02", "CL02", 18) {
    constructor() {
        _mint(msg.sender, INITIAL_MINT_AMOUNT * 10 ** decimals);
    }
}
