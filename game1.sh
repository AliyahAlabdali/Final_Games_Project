#!/bin/bash

# Function to ask a question
ask_question() {
    local question="$1"
    local choices="$2"
    local correct_answer="$3"

    # Increment the question count
    ((question_count++))

    # Print question and choices
    tput setaf 6
    echo "Question $question_count: $question"
    tput sgr0
    echo -e "$choices"
    
    # Prompt user for answer
    read -p "Enter your answer (a, b, c, or d): " user_answer

    # Validate user answer
    if [[ ! "$user_answer" =~ ^[a-d]$ ]]; then
        echo "Invalid input. Please enter a, b, c, or d."
        return
    fi

    # Check if answer is correct
    if [[ "$user_answer" == "$correct_answer" ]]; then
        tput setaf 2
        echo "Correct! Good job."
        ((score++))
    else
        tput setaf 1
        echo "Incorrect! The correct answer was $correct_answer."
    fi
    tput sgr0
    echo ""  # Print an empty line for spacing
}

# Locate the questions file
questions_file=$(find . -type f -name "questions.txt" | head -n 1)

# Check if questions file exists
if [[ ! -f "$questions_file" ]]; then
    echo "Error: Questions file not found or inaccessible."
    exit 1
fi

# Welcome message
echo ""
tput setaf 5
echo "Welcome to the GK Quiz Game!"
tput sgr0
echo "You will be asked 10 questions. Try to answer them correctly."
echo ""

# Initialize score and question count
score=0
question_count=0

# Read questions from the file and process each one
while IFS='|' read -r question choices1 choices2 choices3 choices4 correct_answer; do
    choices=$(printf "%s\n" "$choices1" "$choices2" "$choices3" "$choices4")
    ask_question "$question" "$choices" "$correct_answer"
done < <(grep -v '^#' "$questions_file")  # Exclude comment lines

# Display final score
echo "Quiz complete. You answered $score out of $question_count correctly."
echo "Thank you for playing!"
