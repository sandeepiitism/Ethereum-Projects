// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract A {
    uint256 public numbers;


    function getNum(uint256 _numbers) public {
        for(uint256 i=0; i<=_numbers; i++) {
            numbers = numbers+i;
        }
    }

    function get() public returns (uint256 numbers)  {
        return numbers;
    }
}
