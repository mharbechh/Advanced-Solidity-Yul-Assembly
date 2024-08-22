// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EvmDynamicSizeArray {
    uint256[] public arr1 = [11,22,33];
    uint128[] public arr2 = [1,2,3];

    function getSlotIndex(uint _arrSlotIndex) public pure returns(uint256 _slotIndex) {
        _slotIndex = uint256(keccak256(abi.encode(_arrSlotIndex)));
    }
  
    function readSlot256(uint256 _slotIndex) public view returns(uint256 _valSlot256) {
        assembly {
            _valSlot256 := sload(_slotIndex)
        }
    }

    function readSlot128(uint _slotIndex, uint numBitShifting) public view returns(uint128 _valSlot128) {
        assembly {
            let slot_val := sload(_slotIndex)
            slot_val := shr(numBitShifting, slot_val)
            _valSlot128 := slot_val
        }
    }
}