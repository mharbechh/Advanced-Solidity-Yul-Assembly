// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract NestedMapping {
    
    address public constant ADD1 = address(1);
    address public constant ADD2 = address(2);
    address public constant ADD3 = address(3);
    mapping(uint256 => mapping(address => uint256)) public IdToAddressToAmount;
    
    function setMap(uint256 _key1, uint256 _val) public {
        IdToAddressToAmount[_key1][ADD1] = _val;
    }

    function getSlotIndex(uint256 _key, uint256 _slotIndex) public pure returns(uint256 _index) {
        bytes32 hashedVal = keccak256(abi.encode(_key, _slotIndex));
        assembly {
            _index := hashedVal
        }
    }

    function readSlotVal(uint256 _slotIndex) public view returns(uint256 _val) {
        assembly{
            _val := sload(_slotIndex)
        }
    }
}