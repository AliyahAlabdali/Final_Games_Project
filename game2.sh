#!/bin/bash

scorefile="highscores_bash"
play_again="yes"
quit_game="no"

echo "Random number guesser!"

total_score=0  # Move total_score initialization outside the loop

while [ "$play_again" = "yes" ] && [ "$quit_game" = "no" ]; do
    num_guesses=0

   # Seed the random number generator
  RANDOM=$(( $(date +%s%N) % 32768 ))
    # Generate random number
    random_number=$((RANDOM % 10))


    while true; do
        read -p "What is the random number you would like to guess? Please pick a number between 0 and 9 (or enter 'q' to quit): " user_guess

        if [ "$user_guess" = "q" ]; then
            quit_game="yes"
            break
        elif [[ "$user_guess" =~ ^[0-9]$ ]]; then
            num_guesses=$((num_guesses + 1))

            if [ "$user_guess" -eq "$random_number" ]; then
                echo "You guessed right! Congratulations, $random_number is equal to $user_guess"
                total_score=$((total_score + 1))
                break
            else
                echo "You guessed wrong! Try again."
            fi
        else
            echo "Invalid input. Please enter a number between 0 and 9 or 'q' to quit."
        fi
    done

    if [ "$quit_game" != "yes" ]; then
        read -p "Would you like to play again? (yes/no): " play_again

        if [ "$play_again" != "yes" ]; then
            echo "Thank you for playing! Your final score is $total_score"
            break
        fi
    fi
done

read -p "Please enter your name: " name
echo "$name $total_score" >> "$scorefile"

printf "\nPrevious high scores:\n"
cat "$scorefile"
