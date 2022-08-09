// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberReversal {
    function reversenum(uint n) public pure returns (uint) {
        uint reverse = 0;

        while (n != 0) {
            reverse = reverse * 10 + n%10;
            n /= 10;
        }
        return reverse;
    }
}
