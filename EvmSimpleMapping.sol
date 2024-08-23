// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleMapping {
    mapping( uint256 => uint256) public IdToFavoriteNumber;

    function setMap(uint256 _id, uint256 _favoriteNumber) public {
        IdToFavoriteNumber[_id] = _favoriteNumber;
    }

    function getIemSlotIndex(uint256 _key, uint256 _slotIndex) public pure returns(uint256 _index) {
        bytes32 hashedVal = keccak256(abi.encode(_key, _slotIndex));
        assembly {
            _index := hashedVal
        }
        
    }

    function readSlot(uint _slotIndex) public view returns(uint256 _val) {
        assembly {
            _val := sload(_slotIndex)
        }
    }
}