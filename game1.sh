#!/bin/bash

# Function to ask a question
ask_question() {
     question="$1"
     choices="$2"
     correct_answer="$3"

    # Increment the question count using expr
    question_count=$(expr $question_count + 1)
    tput setaf 6
    echo "Question $question_count: $question"
    tput sgr0
    echo -e "$choices"

    # Loop until valid input is received
    while true; do
        read -p "Enter your answer (a, b, c, or d) or 'q' to quit: " user_answer
        echo "You entered: $user_answer"  # Debug line to see what user entered

        # Check if the user wants to quit
        if [[ "$user_answer" == "q" ]]; then
            echo "Exiting quiz. Thank you for playing!"
            exit 0
        fi

        # Validate user answer
        if [[ ! "$user_answer" =~ ^[a-d]$ ]]; then
            tput setaf 1
            echo "Invalid input. Please enter a, b, c, or d."
            echo ""
            tput sgr0
        else
            break  # Break the loop if input is valid
        fi
    done

    if [[ "$user_answer" == "$correct_answer" ]]; then
        tput setaf 2
        echo "Correct! Good job."
        tput sgr0
        score=$(expr $score + 1)
    else
        tput setaf 1
        echo "Incorrect! The correct answer was $correct_answer."
        tput sgr0
    fi
    echo ""  # Print an empty line for spacing
}


# Using find to locate the questions file and grep to filter unnecessary lines
questions_file=$(find . -type f -name "questions.txt" | head -1)  # Assuming only one file named questions.txt
mapfile -t questions < <(grep -v '^#' "$questions_file")  # Exclude comment lines

# Welcome message using awk

echo ""
tput setaf 5
echo "Welcome to the GK Quiz Game!" | awk '{print $0}'
tput sgr0

echo "You will be asked 10 questions. Try to answer them correctly." | awk '{print $0}'
echo ""

# Initialize score and question count
score=0
question_count=0

# Process each question from the array
for line in "${questions[@]}"; do
    IFS='|' read -r question choices1 choices2 choices3 choices4 correct_answer <<< "$line"
    choices=$(echo -e "${choices1}\n${choices2}\n${choices3}\n${choices4}" | awk '{print $0}')
    ask_question "$question" "$choices" "$correct_answer"
done

# Score output using expr and awk for final message
echo "Quiz complete. You answered $score out of $question_count correctly." | awk '{print $0}'
echo "Thank you for playing!" | awk '{print $0}'


