// ✅ What is an Enum in Solidity?
// An enum (enumeration) in Solidity is a user-defined data type that allows you to define a set of named constant values. It helps improve code readability and reduces the use of uint or bool flags for state management.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Raffle {
    enum RaffleState { OPEN, CALCULATING, CLOSED } // Define states

    RaffleState public raffleState; // Store the current state

    constructor() {
        raffleState = RaffleState.OPEN; // Set initial state
    }

    function enterRaffle() public {
        require(raffleState == RaffleState.OPEN, "Raffle is not open!");
        // Logic for entering the raffle
    }

    function pickWinner() public {
        require(raffleState == RaffleState.OPEN, "Raffle must be open to pick a winner");
        raffleState = RaffleState.CALCULATING; // Change state
    }

    function resetRaffle() public {
        raffleState = RaffleState.OPEN; // Reset to initial state
    }
}

// 🔹 When to Use enum in Solidity?
// Managing contract states (e.g., OPEN, CLOSED, PENDING).

// Avoiding boolean flags (e.g., isActive = true/false is less readable than Status.ACTIVE).

// Improving code readability and reducing errors.

// 🔹 Where to Use enum?
// State Machines (e.g., Lottery, Crowdfunding, Escrow, DAO proposals).

// Role Management (e.g., enum Role { USER, ADMIN, MODERATOR }).

// Order Status (e.g., enum OrderStatus { PENDING, SHIPPED, DELIVERED }).

// Would you like more examples tailored to your use case? 🚀