// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayReversal {


    function revArray(uint[] memory arr, uint len) public pure returns (uint[] memory) {
        uint temp;
        for (uint i=0; i<len/2; i++) {
            temp = arr[i];
            arr[i] = arr[len-i-1];
            arr[len-i-1]=temp;
        }

        return arr;
    }
}
        
