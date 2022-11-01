// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

interface manacala {
    struct Board {
        uint256[5] holes; // six holes per side of board
        uint256 home; // players gem count in home hole
    }

    function move(uint256 hole) external; // moves playes gems in selected hole
    function viewBoard() view external; // returns board gems

}