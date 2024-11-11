// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestStructDemo {
    // 定义一个Person结构体
    struct Person {
        string name;
        uint age;
        address walletAddress;
    }
    // 定义一个Employ结构体
    struct Employ {
        Person person;
        string position;
    }

    // 声明一个Person结构体变量
    Person public person;
    // 声明一个Person数组结构体变量
    Person[] public arrayPerson;
    // 声明一个Employe结构体
    Employ public employ;


    // 设置Person的值
    function setPerson(string memory _name, uint _age, address _walletAddress) public {
        person.name = _name;
        person.age = _age;
        person.walletAddress = _walletAddress;
    }

    // 获取Person的值
    function getPerson() public view returns (string memory, uint, address){
        return (person.name, person.age, person.walletAddress);
    }

    // 往Person数组中添加元素
    function addArrayPerson(string memory _name, uint _age, address _walletAddress) public {
        // Person memory newPerson = Person({
        //     name : _name,
        //     age : _age,
        //     walletAddress : _walletAddress
        // });
        // arrayPerson.push(newPerson);
        arrayPerson.push(Person(_name,_age,_walletAddress));
    }

    // 获取Person数组的元素
    function getArrayPerson(uint index) public view returns (string memory, uint, address){
        // Person memory newPerson = arrayPerson[index];
        // return (newPerson.name, newPerson.age, newPerson.walletAddress);
        return (arrayPerson[index].name, arrayPerson[index].age, arrayPerson[index].walletAddress);
    }

    // 获取Person数组的元素个数
    function getArrayPersonCount() public view returns (uint) {
        return arrayPerson.length;
    }

    // 设置Employ的值
    function setEmploye(string memory _name, uint _age, address _walletAddress, string memory _position) public {
        employ.person = Person(_name,_age,_walletAddress);
        employ.position = _position;
    }

    // 获取Employ的值
    function getEmploye() public view returns (string memory, uint, address, string memory){
        return (employ.person.name,employ.person.age,employ.person.walletAddress,employ.position);
    }
}
