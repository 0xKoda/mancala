// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

contract Mancalar {
    struct Board {
        uint256[6] holes; // six holes per side of board
        uint256 home; // players gem count in home hole
    }
    address playerOne;
    address playerTwo;
    address starter;
    bool started;
    address turn;
    mapping(address => Board) players;

    function startGame(address one, address two) public {
        playerOne = one;
        playerTwo = two;
        players[one].holes[0] = 4;
        players[one].holes[1] = 4;
        players[one].holes[2] = 4;
        players[one].holes[3] = 4;
        players[one].holes[4] = 4;
        players[one].holes[5] = 5;

        players[two].holes[0] = 4;
        players[two].holes[1] = 4;
        players[two].holes[2] = 4;
        players[two].holes[3] = 4;
        players[two].holes[4] = 4;
        players[two].holes[5] = 5;

        starter = address(msg.sender);
        started = false;
    }

    function move(uint256 hole) public {
        if(!started){
            require(msg.sender == playerOne, "not your turn");
            // turn logic
            started = true;
            turn = playerTwo;
        }
        if(started){
            require(msg.sender == turn, "not your turn");
            //turn logic
            if(msg.sender == playerOne){
                turn = playerTwo;
            }
            if(msg.sender == playerTwo){
                turn = playerOne;
            }
        }
    }

}