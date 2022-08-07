// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sumofDigit {


    function findsumofN (uint num, uint a, uint b, uint c) public pure returns (uint) {
        uint[100] memory arr;
        uint i;
        arr[1] = a;
        arr[2] = b;
        arr[3] = c;

        for (i=4; i<=num; i++) {
            arr[i] = arr[i-1] + arr[i-2] + arr[i-3];
            }
            return arr[num];
    }
}
