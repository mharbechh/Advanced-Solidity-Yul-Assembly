// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EvmFixedSizeArray {
    uint256[3] public arr1 = [1,2,3];
    uint256[3] public arr2 = [4,5,6];
    uint128[5] public arr3 = [7,8,9,10,11];

    // Read data from not packed variable

    function ReadSlot256(uint _indexSlot) public view returns(uint256 _r) {
        assembly {
            _r := sload(_indexSlot)
        }
        
    }
    // Read data from packed variable
    function ReadSlot128(uint _indexSlot, uint _bitsToShift) public view returns(uint128 _r){
        assembly {
            let slot_data := sload(_indexSlot)
            slot_data := shr(_bitsToShift, slot_data)
            _r := slot_data
        }
    }

}