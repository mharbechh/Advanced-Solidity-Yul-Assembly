// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ReadWriteStorage {
    uint public x;
    uint public y;
    bytes32 public c;

    function store1() public {
        assembly {
            sstore(0,1)
            sstore(1,11)
            sstore(2,0x4f4f4f)
        }
    }
    function store2() public {
        uint z;
        assembly {
            sstore(x.slot,2)
            sstore(y.slot,22)
            sstore(c.slot,0x3f3f3f3f)
            z := 255
        }
    }
    function read1() public view returns(uint _x, uint _y, bytes32 _c) {
        assembly {
            _x := sload(0)
            _y := sload(1)
            _c := sload(2)
        }
    }
    function read2() public view returns(uint _x, uint _y, bytes32 _c) {
        assembly {
            _x := sload(x.slot)
            _y := sload(y.slot)
            _c := sload(c.slot)

        }
    }
}