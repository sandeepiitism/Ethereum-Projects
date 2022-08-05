// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reminder {

    function findRem(uint a, uint b, uint c) public pure returns (uint) {
        require(a>0,"a should not be negative");
        require(b>0,"a should not be negative");
        require(c>0,"a should not be negative");
        return (a+b+c)/3;
    }
}
