// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructDemo {
    // 定义一个结构体
    struct Person {
        string name;
        uint age;
        address walletAddress;
    }

    // 创建一个结构体数组
    Person[] public people;

    // 添加一个新的人到结构体数组
    function addPerson(string memory _name, uint _age, address _walletAddress) public {
        Person memory newPerson = Person({
            name: _name,
            age: _age,
            walletAddress: _walletAddress
        });

        people.push(newPerson);
    }

    // 获取指定索引的人的信息
    function getPerson(uint index) public view returns (string memory, uint, address) {
        require(index < people.length, "Index out of bounds");
        Person memory person = people[index];
        return (person.name, person.age, person.walletAddress);
    }

    // 获取结构体数组的长度
    function getPeopleCount() public view returns (uint) {
        return people.length;
    }
}
