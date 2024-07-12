# AutoDoor contract


The AutoDoor Contract is my attempt to peek further into the role or capabilities of blockchain in manipulating technology. It is done using Solidity programming language, with this project, I was able to visualize the use IoT and anything related that helps manipulate technology. 

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract's main purpose is to show the opening and closnig of the AutoDoor Contract. This program serves as a simple and straightforward introduction to Solidity programming and how it can be connected to different kinds of technology. 

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. 

Go to the Remix website at https://remix.ethereum.org/ then create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension.

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.11" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, click the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "AutoDoor" contract from the dropdown menu, and then click on the "Deploy" button.

Below the deploy button you will see the "Deployed contract" where you can manipulate or call on the code and its functions using the user interface. Here you can test the interactions with the different functions as the owner and as other users.

```javascript
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

```
## Authors

Elijah Raphael A. Gaylan
