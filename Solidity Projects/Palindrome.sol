// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Palindrome {

    function checkpalindrome(uint num) public view returns (uint) {
        uint revnum = 0;
        uint tempnum;

        tempnum = num;
        while (num!=0) {
            revnum = revnum * 10;
            revnum = revnum + num%10;
            num = num/10;
        }

        if (tempnum == revnum) {
            return 1;
        } else {
            return 0;
            }
        

    }
}
