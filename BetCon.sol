pragma solidity ^0.4.11;

contract BetCon {
    address owner;
    mapping (address => uint) public balances;
    struct BetLog {
        address better;
        uint betamt;
        uint betnum;
    }    
    uint public TotalBets;
    
    mapping (uint => BetLog) public betlogs;
    
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function BetCon() {
		balances[tx.origin] = 10000;
		TotalBets = 0;
		owner = msg.sender;
	}
    function Bet(address b1,uint u1,uint n1) returns(bool s1){
        if (balances[b1] < u1) return false;
        TotalBets++;
		balances[b1] -= u1;
		balances[owner] += u1;
		Transfer(b1, owner, u1);
		betlogs[TotalBets].better = b1;
		betlogs[TotalBets].betamt = u1;
		betlogs[TotalBets].betnum = n1;
		return true;
    }
	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		if (balances[owner] < amount) return false;
		balances[owner] -= amount;
		balances[receiver] += amount;
		Transfer(owner, receiver, amount);
		return true;
	}

	function getBalance(address addr) constant returns(uint) {
		return balances[addr];
	}

    function WinDeal(uint w1) returns(bool r1){
        if (w1 < 1 || w1 > 9) return false;
        for (uint i = 0; i < 10; i++) {
            if (betlogs[i].betnum == w1){
                sendCoin(betlogs[i].better,betlogs[i].betamt * 5);
            }
        }    
    }
}