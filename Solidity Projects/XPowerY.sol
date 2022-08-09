// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract power {

    function powerofX(uint256 x, uint256 y) public pure returns (uint256) {
        uint256 result = 1;
        while (y != 0) {
            result *= x;
            --y;
        }
        return result;
    }
}
