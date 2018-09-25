pragma solidity ^0.4.0;

library Lib{
    struct Group{
        mapping(address => bool) members;
    }
    
    function addMember(Group storage self, address addr) returns (bool){
        if(self.members[addr]){
            return false; //already a member
        }
        
        self.members[addr] = true;
        return true;
    }
    function delMember(Group storage self, address addr) returns (bool){
        if(!self.members[addr]){
            return false; //member doesn't exist hence cant delete
        }
        
        self.members[addr] = false;
        return true;
    }
}