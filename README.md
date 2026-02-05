# Tic-Tac-Toe (Ruby OOP Project)

This project is a complete implementation of a two-player Tic-Tac-Toe game written fully in Object-Oriented Ruby.  
It was created as part of The Hacking Project bootcamp to practice class architecture, abstraction, clean code, and terminal UI.

---
## File Tree: morpion


```
├── 📁 lib
│   ├── 💎 application.rb
│   ├── 💎 board.rb
│   ├── 💎 board_case.rb
│   ├── 💎 game.rb
│   ├── 💎 player.rb
│   └── 💎 show.rb
├── 📄 Gemfile
├── 📝 README.md
└── 💎 app.rb
```

## 🧠 Features

- Two human players (no AI)
- The game asks for each player's name at startup
- A 3×3 board using classic coordinates (A1–C3)
- Turn-by-turn board display in the terminal
- Players alternate between **X** and **O**
- Input validation:  
  - invalid positions (`Z9`, etc.)  
  - already occupied cells
- Game-end detection:  
  - victory (row, column, diagonal)  
  - draw (board full)
- Automatic result display (winner or draw)
- Option to start a new game at the end
- Clean and readable terminal UI (optional colors using the `colorize` gem)
- 100% full OOP, each class in its own file

---

## 🛠 Installation

Make sure you have Ruby installed (version 2.7+ recommended).

Clone the repository:

```bash
git clone <your_repo_url>
cd morpion
Install dependencies:
```
bash
```
bundle install
```
▶️ Running the Game


bash
```
ruby app.rb
```
You will be prompted to:

Enter the names of Player 1 and Player 2

Play by choosing positions like A1, B3, C2, etc.

Continue until a win or a draw

Choose whether to start a new game

🎮 Gameplay Example

```
TIC-TAC-TOE
Round n° 3
```


```      
      1   2   3
-----------------
| A | X | O | X |
-----------------
| B |   | X |   |
-----------------
| C | O |   | O |
-----------------
```

It's Alice's turn (O)
Choose a cell: B3
🧬 Object-Oriented Design
Classes
Class	Responsibility
Application	Manages game sessions + replay loop
Game	Handles one game (turns, win conditions)
Player	Stores player name and symbol (X/O)
Board	Contains 9 BoardCase objects + rules
BoardCase	Represents a single cell (A1, B2, etc.)
Show	Handles display and terminal output

This architecture follows clean responsibility separation and full OOP design.

🧪 Testing
Try playing through:

A normal win (horizontal, vertical, diagonal)

A draw (board full)

Invalid moves (Z2, A5, etc.)

Selecting a taken cell

Starting a new game

Everything should behave as expected.

📜 License
This project is for educational use within The Hacking Project.
Feel free to modify or improve it in your own fork.