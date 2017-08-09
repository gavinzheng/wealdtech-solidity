pragma solidity ^0.4.11;

import "../auth/Permissioned.sol";


/**
 * @title PermissionedStorage
 * Permissioned storage is a general-purpose storage contract holding data
 * that can be set by allowed parties.
 * Note that permissions are all-or-nothing, so this contract should not be
 * shared between multiple parties that might have differing permissions.
 */
contract PermissionedStorage is Permissioned {
    uint32 constant public PERM_WRITE = 0x85b20001;

    mapping(bytes32 => uint256) UInt256Storage;

    function getUInt256(bytes32 record) constant public returns (uint256) {
        return UInt256Storage[record];
    }

    function setUInt256(bytes32 record, uint256 value) public ifPermitted(msg.sender, PERM_WRITE) {
        UInt256Storage[record] = value;
    }

    mapping(bytes32 => string) StringStorage;

    function getString(bytes32 record) constant returns (string) {
        return StringStorage[record];
    }

    function setString(bytes32 record, string value) public ifPermitted(msg.sender, PERM_WRITE) {
        StringStorage[record] = value;
    }

    mapping(bytes32 => address) AddressStorage;

    function getAddress(bytes32 record) constant returns (address) {
        return AddressStorage[record];
    }

    function setAddress(bytes32 record, address value) public ifPermitted(msg.sender, PERM_WRITE) {
        AddressStorage[record] = value;
    }

    mapping(bytes32 => bytes) BytesStorage;

    function getBytes(bytes32 record) constant returns (bytes) {
        return BytesStorage[record];
    }

    function setBytes(bytes32 record, bytes value) public ifPermitted(msg.sender, PERM_WRITE) {
        BytesStorage[record] = value;
    }

    mapping(bytes32 => bool) BooleanStorage;

    function getBoolean(bytes32 record) constant returns (bool) {
        return BooleanStorage[record];
    }

    function setBoolean(bytes32 record, bool value) public ifPermitted(msg.sender, PERM_WRITE) {
        BooleanStorage[record] = value;
    }
    
    mapping(bytes32 => int) IntStorage;

    function getInt(bytes32 record) constant returns (int) {
        return IntStorage[record];
    }

    function setInt(bytes32 record, int value) public ifPermitted(msg.sender, PERM_WRITE) {
        IntStorage[record] = value;
    }
}