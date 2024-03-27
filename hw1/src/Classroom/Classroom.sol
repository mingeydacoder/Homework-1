// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable

    uint256 private secondReturnValue; 

    function register() external returns (uint256) {
        if (secondReturnValue == 0) {
            secondReturnValue = 123; 
            return 1000;
        } else {
            return secondReturnValue;
        }
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        if (!IClassroomV2(msg.sender).isEnrolled()) {
            return 1000;
        } 
        else {
            return 123;
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        uint256 remainingGas = gasleft();

        if (remainingGas > 6857) {
            return 1000; 
        } 
        else {
            return 123; 
        }
    }
}
