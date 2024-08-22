// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EvmStorageStruct {
    // variable in yul are handled as bytes32
    struct Packed {
        uint128 a;
        uint64 b;
        uint64 c;
    }
    struct NotPacked {
        uint256 a;
        uint256 b;
        uint256 c;
    }
    Packed public packed = Packed(1,11,111);
    NotPacked public notPacked = NotPacked(2,22,222);

    function ReadNotPackedSlot(uint _slotIndex) public view returns(uint256 _value){
        assembly {
            _value:=sload(_slotIndex)
        }


    }
    function ReadPackedSlotSlot128(uint _slotIndex) public view returns(uint128 _value) {
        assembly {
            _value := sload(_slotIndex)
        }
    }
    function ReadPackedSlot64(uint _slotIndex, uint _numBitShifting) public view returns(uint64 _value){
        assembly {
            let slotVal := sload(_slotIndex)
            slotVal := shr(_numBitShifting, slotVal)
            _value := slotVal
            
        }
       
    }
}