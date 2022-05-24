// SPDX-License-Identifier: musjib
pragma solidity ^0.8.7;

contract Test{
    uint x;
    constructor(){
        x = 100;
    }
    uint age = 12;
    string name = 'musa';
    bool isMarried = false;
    uint[3] friends;

    struct Human{
        string name;
        uint age;
    }

    Human developer = Human('Musa', 19);

    address myAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138; 

    mapping(uint => string) students;
     
     //normal function
    function add(uint a, uint b) public pure returns(uint){
        return a + b;
    }

     //view function
    function getX() public view returns(uint){
        return x;
    }

    function transfer() public payable {}

//
    function getContactBalance() public view returns(uint){
        return address(this).balance;      
    }
}