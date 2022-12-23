// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract CoinX {

    uint public totalSupply;

     mapping(address => uint256) public balances;

    function mine(uint minedCoins) public{

        totalSupply = totalSupply + minedCoins;

        balances[msg.sender]  += minedCoins;
    }
    function transferEther(address reciever , uint addValue ) public{

        require(balances[msg.sender] <  addValue , "Your account balance is low , Transaction failed !!");
        
        // deducting amout from sender 
        balances[msg.sender]  -= addValue;
         
        //  adding amount to reciever
        balances[reciever] +=  addValue;
    }

    function balanceOf(address caller) public view returns (uint256 balance) {

    return balances[caller];
}
}