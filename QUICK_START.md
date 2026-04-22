# LÖVE 2D Pong Game - Quick Setup

## Installation (One-time setup)

### macOS:
```bash
brew install love
```

### Linux (Ubuntu/Debian):
```bash
sudo apt install love
```

### Windows:
Download from https://love2d.org/wiki/Getting_Started

## Running the Game

```bash
cd /Users/macbook/Pong
love .
```

That's it! The game should launch immediately.

## Troubleshooting

**Command not found: `love`**
- Make sure LÖVE 2D is installed correctly
- On macOS with M1/M2: Install native build - `brew install love`

**Still issues?**
- Open the Pong folder and drag it onto the LÖVE 2D desktop icon
- Or check https://love2d.org/wiki/Getting_Started for your OS

## Quick Config Changes

Edit `config.lua` to change:
- Game speed: `ball.speed = 300` (increase for harder)
- Paddle speed: `paddle.speed = 300` (increase for more responsive)
- Colors: `colors.paddle = { 1, 0, 0, 1 }` (RGB format, 0-1)
- Game size: `canvas = { width = 800, height = 400 }`

Save and press F5 in your editor, then rerun the game to see changes!
