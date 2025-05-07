# 🐧 Linux User Greeting Project

This is a terminal-based project that greets the user based on the current time of day using colorful and interactive Bash scripts. It leverages tools like `dialog`, `figlet`, and `lolcat` to provide a simple yet fun user interface.

---

## 📦 Features

- Interactive user input using `dialog`
- Time-based personalized greetings:
  - Good Morning
  - Good Afternoon
  - Good Evening
- Colorful ASCII art greetings using `figlet` and `lolcat`
- Logs greetings with timestamps
- Themed TUI (Text User Interface) via `.dialogrc` customization

---

## 🛠️ Tools & Technologies

- **Bash** – Core scripting language
- **dialog** – For terminal-based UI input
- **figlet** – For ASCII text banners
- **lolcat** – For colorful text display
- **git** – Version control

---

## 🚀 Getting Started

### Prerequisites

Make sure these packages are installed:

```bash
sudo apt update
sudo apt install dialog figlet lolcat
export DIALOGRC=~/.mydialogrc
Linux-Project/
├── greet_user.sh # Main script for user greeting flow
├── utils.sh # Utility functions used by main script
├── .mydialogrc # Custom dialog UI theme
├── README.md # Project info
└── logs/ # Greeting logs (if implemented)
