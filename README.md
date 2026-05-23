# Shell Play - Final Games Project

Welcome to **Shell Play**! This is a collection of interactive, text-based terminal games built entirely using Bash and Shell scripting. The project features a unified main menu that links a General Knowledge quiz, a random number guesser, and a classic Rock-Paper-Scissors game.

---

## 🎮 Features & Included Games

The suite contains three standalone games managed by a central launcher:

### 1. Main Menu (`main_menu.sh`)
* **The Hub:** Acts as the central interface for the project. 
* **Seamless Navigation:** Allows users to choose a game, handles validations for incorrect inputs, and prompts whether to play another round or exit cleanly upon game completion.

### 2. General Knowledge Quiz (`game1.sh`)
* **Data-Driven:** Reads external quiz data from `questions.txt`, filtering out comment lines.
* **Interactive Evaluation:** Presents multiple-choice questions (a, b, c, or d), keeps an active score tracking system, and uses colored text feedback for correct/incorrect answers.
* **Quit Feature:** Users can type `q` at any point to gracefully exit the quiz.

### 3. Numbers Guesser (`game2.sh`)
* **Dynamic Seeding:** Uses nanosecond timestamping to seed `$RANDOM` for unpredictable number generation between 0 and 9.
* **Persistent High Scores:** Saves user names and final scores locally to a `highscores_bash` file and prints out the leaderboard history at the end of the session.

### 4. Rock, Paper, Scissors (`game3.sh`)
* **3-Round Match:** A classic showdown against an automated terminal opponent using randomized selections (`shuf`).
* **Session Storage:** Actively tracks user and computer scores using a temporary data file (`scores.txt`) and dynamically updates line entries using `sed`. 
* **Clean Up:** Destroys temporary data sheets once the session closes to keep your directory clean.

---

## 🛠️ Requirements & Installation

To run these games, you need a Unix-like environment (Linux, macOS, or WSL on Windows) with `bash` or `sh`.

1. **Clone the repository and set permissions:**
```bash
   git clone [https://github.com/AliyahAlabdali/Final_Games_Project.git](https://github.com/AliyahAlabdali/Final_Games_Project.git)
   cd Final_Games_Project
   chmod +x main_menu.sh game1.sh game2.sh game3.sh
```
## 🚀 How to Play

Start the entire bundle by launching the main menu script:

```bash
./main_menu.sh
```
Note: Ensure that questions.txt stays in the same directory as game1.sh, as the program dynamically searches for it to load your quiz questions.
## 📂 Project Structure

```text
Final_Games_Project/
├── main_menu.sh    # Main menu interface and game launcher
├── game1.sh        # General Knowledge game script
├── game2.sh        # Number guessing game script
├── game3.sh        # Rock, Paper, Scissors game script
├── questions.txt   # Question bank for the general knowledge game
└── README.md       # Project documentation
```
## 👥 Contributors

We are a team of students dedicated to building interactive command-line interfaces and lightweight terminal entertainment systems through scripting.

* **Aliyah Alabdali** — [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/AliyahAlabdali)
* **Rahaf Almalki** — [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/RahafAlmalki)
* **Ghala Alotaibi** — [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/ghala44)
