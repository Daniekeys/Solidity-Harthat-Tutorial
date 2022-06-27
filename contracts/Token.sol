pragma solidity ^0.8.0;
// SPDX-License-Identifier: GPL-3.0
import 'hardhat/console.sol';
contract Token {
string public name = "My hardhat token";
string public symbol = "MHT";
uint public totalSupply = 1000000;
address public owner;
mapping(address => uint) balances;

constructor() {
    balances[msg.sender] = totalSupply;
    owner = msg.sender;

}

function transferToken(address to, uint amount) external {
    console.log('Sender balance is %s tokens', balances[msg.sender]);
    console.log('Trying to send the %s token to %s', amount, to);
    require(balances[msg.sender] >= amount, "Not enough token");
    balances[msg.sender] -= amount;
    balances[to] += amount; 
}
function balanceOf (address account) external view returns(uint) {
return balances[account];

}
}