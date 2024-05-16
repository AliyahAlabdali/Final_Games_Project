#!/bin/bash

# Function to ask a question using expr for calculations
ask_question() {
     question="$1"
     choices="$2"
     correct_answer="$3"

    # Increment the question count using expr
    question_count=$(expr $question_count + 1)

    echo "Question $question_count: $question"
    echo -e "$choices"
    read -p "Enter your answer (a, b, c, or d): " user_answer
    echo "You entered: $user_answer"  # Debug line to see what user entered

    if [[ "$user_answer" == "$correct_answer" ]]; then
        echo "Correct!"
        score=$(expr $score + 1)
    else
        echo "Incorrect! The correct answer was $correct_answer."
    fi
    echo ""  # Print an empty line for spacing
}

# Using find to locate the questions file and grep to filter unnecessary lines
questions_file=$(find . -type f -name "questions.txt" | head -1)  # Assuming only one file named questions.txt
mapfile -t questions < <(grep -v '^#' "$questions_file")  # Exclude comment lines

# Welcome message using awk
echo "Welcome to the General Knowledge Quiz Game!" | awk '{print $0}'
echo "You will be asked several questions, try to answer them correctly." | awk '{print $0}'
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

