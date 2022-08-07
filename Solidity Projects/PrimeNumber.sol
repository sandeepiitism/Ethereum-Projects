//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract findPrime {
    function prime(uint256 n) public pure returns (uint256) {
        if (n <= 1) {
            return 0; //not prime
        }
        for (uint256 i = 2; i < n; i++) {
            if (n % i == 0) {
                return 0; //not prime
            }
        }
        return 1; //prime
    }
}
