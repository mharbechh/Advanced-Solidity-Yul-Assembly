// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract PackedVariable {
    uint128 public s_a;
    uint64 public s_b;
    uint32 public s_c;
    uint32 public s_d;

    function setA() public {
        assembly {
            let v := sload(s_a.slot)
           let maskA := not(sub(shl(128,1),1))
           v := and(v,maskA)
           v := or(v, 11)
           sstore(0,v)
        }
    }
    function setB() public {
        assembly{
            let v := sload(s_b.slot)
            let maskB := not(shl(128,sub(shl(64, 1),1)))
            v := and(v, maskB)
            v := or(v, shl(128,22))
            sstore(0, v)
        }
        
    }
    function setC() public {
        assembly{
            let v := sload(s_c.slot)
            let maskC := not(shl(s_c.offset,sub(shl(32,1),1)))
            v := and(v, maskC)
            v := or(v, shl(192, 33))
            sstore(0, v)
        }
    }
    function setD() public {
        assembly {
            let v := sload(s_c.slot)
            let maskD := not(shl(s_d.offset,sub(shl(32,1),1)))
            v := and(v, maskD)
            v := or(v, shl(224,44))
            sstore(0,v)
        }
        

    }

    function load32(uint _index, uint num_bits_shift) public view returns(uint32 _var) {
        assembly {
            let slot_contenu := sload(_index)
            _var := shr(num_bits_shift,slot_contenu)
        }
        
    }
    function load64(uint _index, uint num_bits_shift) public view returns(uint64 _var) {
        assembly {
            let slot_contenu := sload(_index)
            _var := shr(num_bits_shift,slot_contenu)
        }
        
    }
    function load128(uint _index, uint num_bits_shift) public view returns(uint128 _var) {
        assembly {
            let slot_contenu := sload(_index)
            _var := shr(num_bits_shift,slot_contenu)
        }
        
    }
}