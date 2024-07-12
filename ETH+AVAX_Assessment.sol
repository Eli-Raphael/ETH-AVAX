pragma solidity ^0.8.18;

contract AutoDoorContract {
    address public owner;
    bool public doorOpen;
    mapping(address => bool) public authorizedPersonnel;

    constructor() {
        owner = msg.sender;  
    }

    function openDoor() public {
        require(msg.sender == owner || msg.sender == address(this), "Only the owner can open the door");
        require(!doorOpen, "Door open.");
        doorOpen = true;
    }

    function closeDoor() public {
        require(msg.sender == owner || msg.sender == address(this), "Only the owner can close the door.");
        require(doorOpen, "Door closed.");
        doorOpen = false;
    }

    function revertDoor() public {
        if (msg.sender != owner) {
            revert("Only the owner can open/close the door.");
        }
        if (doorOpen) {
            doorOpen = false; 
            revert("The door is open. Automatically closing the door.");
        }
    }

    function assertDoor() public view {
        require(msg.sender == owner || msg.sender == address(this), "Only the owner can open/close the door.");
        assert(!doorOpen); 
    }

    function checkDoorStatus() public view returns (bool) {
        return doorOpen;
    }
}
