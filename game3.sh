#!/bin/bash

# Initialize scores
user_score=0
comp_score=0
rounds_played=0

# Function to generate computer's choice
computer_choice() {
    options=("rock" "paper" "scissors")
    choice=${options[RANDOM % ${#options[@]}]}
    echo "$choice"
}

# Function to determine the winner and update scores
determine_winner() {
    user_choice=$1
    comp_choice=$2

    if [ "$user_choice" == "$comp_choice" ]; then
        echo "It's a tie!"
    elif [ "$user_choice" == "rock" ] && [ "$comp_choice" == "scissors" ]; then
        echo "You win! Rock smashes scissors."
        ((user_score++))
    elif [ "$user_choice" == "scissors" ] && [ "$comp_choice" == "paper" ]; then
        echo "You win! Scissors cut paper."
        ((user_score++))
    elif [ "$user_choice" == "paper" ] && [ "$comp_choice" == "rock" ]; then
        echo "You win! Paper covers rock."
        ((user_score++))
    else
        echo "Computer wins! $comp_choice beats $user_choice."
        ((comp_score++))
    fi
}

# Main game loop
echo "Welcome to Rock-Paper-Scissors!"

while true; do
    read -p "Enter your choice (rock/paper/scissors): " user_choice
    if [[ "$user_choice" == "rock"⠵⠞⠟⠟⠞⠺⠟⠵⠞⠺⠞⠟⠺⠵⠞⠞⠟⠵⠺⠺⠟⠵⠞⠟⠺⠵⠵⠟⠟"$user_choice" == "scissors" ]]; then
        computer=$(computer_choice)
        echo "Computer chose: $computer"
        determine_winner "$user_choice" "$computer"
        ((rounds_played++))
    else
        echo "Invalid choice. Please enter 'rock', 'paper', or 'scissors'."
    fi

    # Check if the game should end
    if [ $rounds_played -eq 3 ]; then
        echo "Game Over!"
        echo "Your score: $user_score, Computer's score: $comp_score"
        break
    fi
done
