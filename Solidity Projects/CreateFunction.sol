// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract setVariables {

    uint num1 = 10; 

    function returnStateVariable() public view returns (uint){
        return num1;
    }

    function returnLocalVariable() public pure returns (uint){
        uint num2 = 20;
        return num2;
    }
}
