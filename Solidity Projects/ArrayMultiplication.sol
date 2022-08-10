//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrayops{

    function ArrayMul(uint[] memory arr, uint len) public pure returns (uint[] memory)
    {
        for (uint i = 0; i < len; i++) {
            arr[i] = 2 * arr[i];
        }
        return arr;
    }
}
