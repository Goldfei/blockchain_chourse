// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructMappingDemo {
    struct Person {
        string name;
        uint age;
        address wallet;
    }

    mapping(address => Person) public person;

    function setPerson(string memory _name, uint _age) public {
        person[msg.sender] = Person({
            name : _name,
            age : _age,
            wallet : msg.sender
        });
    }

    function getPerson(address _address) public view returns (string memory, uint , address){
        Person memory newPerson = person[_address];
        return (newPerson.name, newPerson.age, newPerson.wallet);
    }
}
