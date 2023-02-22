// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // which version of solidity we gonna use.  >.0.8.7

// define a contract
contract SimpleStorage {
    // bool hasFavoriteNumber = true;
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // bytes32 favoriteBytes = "cat";
    uint256 public favoriteNumber; // uint256 by default, storage variable
    
    mapping(string => uint256) public nameToFavoriteNumber; // similar to dictionary key => value
    
    // People public person = People({favoriteNumber: 2, name: "Partick"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public { // _name 
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // calldata -> temporary variables that can't be modified
    // memory -> temporary variables that can be modified
    // storage -> permanent variables that can be modified
}

