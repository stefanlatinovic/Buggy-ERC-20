// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge19} from "../src/Challenge19.sol";

contract Challenge19Test is BaseTest {
    MockChallenge19 private erc19;

    function setUp() public {
        erc19 = new MockChallenge19();
    }

    // @todo implement PoC test
    function test_HooksOnlyCalledOnTransferNotMintBurn() public {
        assertTrue(false);
    }
}

contract MockChallenge19 is Challenge19 {
    // @todo implement `_beforeTokenTransfer`
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        if (from == address(0)) {
            // handle minting
        } else if (to == address(0)) {
            // handle burning
        } else {
            // handle regular transfer
        }
    }

    // @todo implement `_afterTokenTransfer`
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._afterTokenTransfer(from, to, amount);

        if (from == address(0)) {
            // handle minting
        } else if (to == address(0)) {
            // handle burning
        } else {
            // handle regular transfer
        }
    }
}
