#!/bin/sh

# Initialize scores
echo "user_score=0" > scores.txt
echo "comp_score=0" >> scores.txt
rounds_played=0

# Function to generate computer's choice
computer_choice() {
    options="rock paper scissors"
    choice=$(echo "$options" | tr ' ' '\n' | shuf -n 1)
    echo "$choice"
}

# Function to determine the winner and update scores
determine_winner() {
    user_choice=$1
    comp_choice=$2

    # Read current scores
    user_score=$(sed -n 's/^user_score=//p' scores.txt)
    comp_score=$(sed -n 's/^comp_score=//p' scores.txt)

    if [ "$user_choice" = "$comp_choice" ]; then
        echo "It's a tie!"
    elif [ "$user_choice" = "rock" ] && [ "$comp_choice" = "scissors" ]; then
        tput setaf 2
        echo "You win! Rock smashes scissors."
        tput sgr0
        user_score=$((user_score+1))
    elif [ "$user_choice" = "scissors" ] && [ "$comp_choice" = "paper" ]; then
        tput setaf 2
        echo "You win! Scissors cut paper."
        tput sgr0
        user_score=$((user_score+1))
    elif [ "$user_choice" = "paper" ] && [ "$comp_choice" = "rock" ]; then
        tput setaf 2
        echo "You win! Paper covers rock."
        tput sgr0
        user_score=$((user_score+1))
    else
        tput setaf 1
        echo "Computer wins! $comp_choice beats $user_choice."
        tput sgr0
        comp_score=$((comp_score+1))
    fi

    # Update scores in the file
    sed -i "s/^user_score=.*/user_score=$user_score/" scores.txt
    sed -i "s/^comp_score=.*/comp_score=$comp_score/" scores.txt
}

# Main game loop
echo "Welcome to Rock-Paper-Scissors!"

while true; do
    tput setaf 6
    read -p "Enter your choice (rock/paper/scissors/end): " user_choice
    tput sgr0
    case "$user_choice" in
        rock|paper|scissors)
            computer=$(computer_choice)
            echo "Computer chose: $computer"
            determine_winner "$user_choice" "$computer"
            rounds_played=$((rounds_played+1))
            ;;
        end)
            echo "Game ended."
            break
            ;;
        *)
            echo "Invalid choice. Please enter 'rock', 'paper', 'scissors', or 'end' to quit the game."
            ;;
    esac

    # Check if the game should end
    if [ "$rounds_played" -eq 3 ] || [ "$user_choice" = "end" ]; then
        # Read final scores
        user_score=$(sed -n 's/^user_score=//p' scores.txt)
        comp_score=$(sed -n 's/^comp_score=//p' scores.txt)
        echo "Game ended."
        echo "Your score: $user_score, Computer's score: $comp_score"

        # Determine final winner
        if [ "$user_score" -gt "$comp_score" ]; then
            tput setaf 5
            echo "Congratulations! You are the overall winner!"
            tput sgr0
        elif [ "$user_score" -lt "$comp_score" ]; then            
            echo "Computer is the overall winner!"
        else            
            echo "It's a tie overall!"
        fi        
        break
    fi
done

# Clean up the scores file
rm scores.txt
