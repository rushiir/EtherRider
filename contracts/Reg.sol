pragma solidity ^0.5.9;
  
contract Reg {
  string public yourName;

  constructor() public {
        yourName = "Unknown" ;
}

function setName(string memory nm) public{
        yourName = nm ;
}
}