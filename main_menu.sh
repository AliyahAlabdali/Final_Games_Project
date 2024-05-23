#!/bin/bash

tput setaf 5
echo "Welcome to the Multi_game challenge!"
tput sgr0

while true; do
    echo "Please choose a game:"
    echo "1. General Knowledge Game"
    echo "2. Numbers Guesser Game"
    echo "3. Rock, Paper, Scissors Game"
    echo "4. Quit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            ./game1.sh
            ;;
        2)
            ./game2.sh
            ;;
        3)
            ./game3.sh
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            continue
            ;;
    esac

    read -p "Do you want to play another game? (yes/no): " play_again

    case "$(echo "$play_again" | tr '[:upper:]' '[:lower:]')" in
        yes)
            continue
            ;;
        no)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid input. Exiting."
            exit 1
            ;;
    esac

done
