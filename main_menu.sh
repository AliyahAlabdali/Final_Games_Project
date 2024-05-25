#!/bin/bash

# Function to display error messages in red
display_error() {
    tput setaf 1
    echo "$1"
    tput sgr0
}

# Function to prompt the user to play again
play_again_prompt() {
    read -p "Do you want to play another game? (yes/no): " play_again
    case "$(echo "$play_again" | tr '[:upper:]' '[:lower:]')" in
        yes) return 0 ;;
        no) echo "Goodbye!"; exit 0 ;;
        *) display_error "Invalid input. Please enter 'yes' or 'no'."; return 1 ;;
    esac
}

# Main menu loop

echo ""
tput setaf 5
echo "Welcome to Shell Play!"
tput sgr0

while true; do
    echo ""
    echo "Please choose a game:"
    echo "1. General Knowledge Game"
    echo "2. Numbers Guesser Game"
    echo "3. Rock, Paper, Scissors Game"
    echo "4. Quit"

    while true; do
        read -p "Enter your choice: " choice
        case $choice in
            [1-4]) break ;;
            *) display_error "Invalid choice. Please enter a number between 1 and 4." ;;
        esac
    done

    case $choice in
        1) ./game1.sh ;;
        2) ./game2.sh ;;
        3) ./game3.sh ;;
        4) echo "Goodbye!"; exit 0 ;;
    esac

    # Prompt user to play again
    while true; do
        play_again_prompt || continue
        break
    done
done

