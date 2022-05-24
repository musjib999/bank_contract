// SPDX-License-Identifier: musjib

pragma solidity ^0.8.7;

contract Bank {
    address owner;
    struct User {
        string name;
        address payable accountNum;
        uint256 balance;
    }

    mapping(address => User) public users;

    event userRegister(string name, address accNum);


    //modifiers: to restrict access to call the function
    modifier onlyBank() {
        require(msg.sender == owner, "Only bank can access this route");
        _;
    }

    modifier onlyUser() {
        require(msg.sender != owner, "Only user can access this route");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerUser(string memory name, address payable accNum) public onlyBank {
        User memory user = User(name, accNum, 0);
        emit userRegister(name, accNum);
        users[accNum] = user;
    }

    function deposite(address accNum) public onlyUser payable {
        users[accNum].balance += msg.value;
    }

    function getUserBalance(address accNum) public onlyUser view returns (uint256) {
        return users[accNum].balance;
    }

    function getBankBalance() public onlyBank view returns (uint256) {
        return address(this).balance;
    }

    function transfer(address payable reciever, uint256 amount)
        public
        returns (uint256)
    {
        User memory sender = users[msg.sender];
        if (sender.balance >= amount) {
            sender.balance -= amount;
            users[reciever].balance += amount;
        }
        return sender.balance;
    }

    function withdrawCash(address payable recipient, uint256 amount) public {
        if (users[msg.sender].balance >= amount) {
            recipient.transfer(amount);
        }
    }
}
