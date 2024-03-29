//SPDX-License-Identifier: SimPL-2.0
pragma solidity ^0.8.11;

import "GlobalImpl.sol";
import "IAddressManager.sol";

/**
 * @dev storage all used address
 */
contract AddressManager is GlobalImpl, IAddressManager {
    mapping(string => address) private addresses;

    constructor() {

    }

    function setAddress(string memory key, address addr) onlyOwner override public {
        addresses[key] = addr;
    }

    function getAddress(string memory key) public override view returns (address){
        return addresses[key];
    }

    function getAddressPayable(string memory key) public override view returns (address payable){
        return payable(address(uint160(addresses[key])));
    }

}