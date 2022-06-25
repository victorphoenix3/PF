// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";


contract jswitch {
  
  address payable owner;
  address payable receiver;
  uint256 lastAlive;

  constructor(address payable r) public payable {
    owner = payable(msg.sender);
    receiver = r;
    lastAlive = block.number - 1;
  }
    
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  modifier isDead {
    require((block.number - 1 - lastAlive) >= 10);
    _;
  }
  
  function kill() public onlyOwner {
    selfdestruct(owner);
  }

  function still_alive() public onlyOwner {
    lastAlive = block.number;
  }

  function transferFunds() public payable isDead {
    receiver.transfer(address(this).balance);
  }

  receive() external payable {

  }

  function setReceiver(address payable r) public onlyOwner {
      receiver = r;
  }
  
  function getLastAlive() public view returns (uint256) {
    return lastAlive;
  }

  function getOwner() public view returns (address) {
    return owner;
  }

  function getOwnerBalance() public view returns (uint256) {
    return owner.balance;
  }

  function getAddress() public view returns (address payable) {
      return payable(address(this));
  }

  function getContractBalance() public view returns (uint256) {
      return address(this).balance;
  }

  function getReceiverBalance() public view returns (uint256) {
    return receiver.balance;
  }
  
  function getReceiver() public view returns (address payable) {
    return receiver;
  }

  function getBlock() public view returns (uint256) {
      return block.number;
  }
}