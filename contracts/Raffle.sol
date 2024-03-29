//Raffel

pragma solidity ^0.8.7;

error Raffle_NotEnoughETHEntered();

contract Raffel{
  uint private immutable i_entranceFee;
  address payable[] private s_players;

   event RaffleEnter(address indexed player);

    constructor(uint256 entranceFee ){
        i_entranceFee = entranceFee;
    }

   function enterRaffle() public payable{
    if(msg.value < i_entranceFee){
        revert Raffle_NotEnoughETHEntered();
    }
    s_players.push(payable(msg.sender));
    emit RaffleEnter(msg.sender);
   }

    function getEntranceFee() public view returns (uint256){
          return i_entranceFee;
    }

    function getPlayers(uint256 index) public view returns(address){
           return s_players[index];   
    }
}