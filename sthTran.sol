pragma solidity ^0.4.4;

contract ethTran {
  address public owner;

  // constructor
  function ethTran() payable {
    owner = msg.sender;
  }

  // add a new transfer
  function SendEth(address addr) payable{
    if (msg.value == 0 ) throw;
    addr.send(msg.value);
  }

  function WithdrawEth() payable{
    if (msg.value == 0) throw;
    owner.send(msg.value);
  }
}
