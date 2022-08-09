//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array{
    uint[] public arr;
    uint[3] public arr2=[1,2,3];
    uint256[10] public fixedArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    function getArr() public view returns(uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // append a new data and inc in length of array
        arr.push(i);
    }

    function pop() public{
        // remove a new data and dec in length of array
        arr.pop();
    }

    function getlen() public view returns(uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // remove the number with 0 so no change in array length
        delete arr[index];
    }
}
