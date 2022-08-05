// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sumofDigit {

    function findSum (uint num) public pure returns (uint) {
        uint a;
        uint sum = 0;
        while (num>0) {
            a = num%10;
            sum = sum + a;
            num = num/10;
        }

        return sum;
    }
}
