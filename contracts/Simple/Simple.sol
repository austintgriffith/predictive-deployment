pragma solidity ^0.4.24;

contract Simple {

  constructor(uint256 someArgument) public {
    emit Construct(tx.origin,msg.data,msg.sig,msg.sender,someArgument);
  }
  event Construct(address origin, bytes data, bytes4 sig, address sender,uint256 someArgument);

}
