// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mathOperation {


    function add(uint a, uint b) public view returns(uint){
        return a + b;
    }

    function sub(uint a, uint b) public view returns(uint){
        return a - b;
    }

    function div(uint a, uint b) public view returns(uint){
        return a / b;
    }

    function mul(uint a, uint b) public view returns(uint){
        return a * b;
    }
}
