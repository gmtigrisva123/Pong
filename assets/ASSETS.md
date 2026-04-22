# Assets Guide

This folder contains game resources: sounds, images, and fonts.

## 📁 Folder Structure

```
assets/
├── sounds/     🔊 Audio files for sound effects and music
├── images/     🖼️  Image/sprite files for visuals
└── fonts/      🔤 Custom font files for text rendering
```

---

## 🔊 sounds/

Store audio files here (`.ogg`, `.wav`, `.mp3`, `.flac`)

**Suggested sound files:**
- `paddle_hit.wav` - Sound when ball hits paddle
- `ball_bounce.wav` - Sound when ball hits wall
- `score.wav` - Sound when someone scores
- `background_music.ogg` - Background music loop
- `game_over.wav` - End game sound

**How to use in [main.lua](../main.lua):**
```lua
function love.load()
    paddleHitSound = love.audio.newSource("assets/sounds/paddle_hit.wav", "static")
end

function updateBall(dt)
    -- When ball hits paddle:
    paddleHitSound:play()
end
```

---

## 🖼️ images/

Store image/sprite files here (`.png`, `.jpg`, `.gif`)

**Suggested image files:**
- `paddle.png` - Custom paddle sprite
- `ball.png` - Custom ball sprite
- `background.png` - Game background
- `net.png` - Center line decoration
- `ui_border.png` - UI frame

**How to use in [main.lua](../main.lua):**
```lua
function love.load()
    ballImage = love.graphics.newImage("assets/images/ball.png")
end

function drawBall()
    love.graphics.draw(ballImage, ball.x - ball.size, ball.y - ball.size)
end
```

---

## 🔤 fonts/

Store font files here (`.ttf`, `.otf`)

**Suggested font files:**
- `pong.ttf` - Custom game font
- `title.ttf` - Font for title/headers
- `score.ttf` - Font for score display

**How to use in [main.lua](../main.lua):**
```lua
function love.load()
    scoreFont = love.graphics.newFont("assets/fonts/pong.ttf", 40)
end

function drawScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print(gameState.player1Score, 100, 20)
end
```

---

## 🔗 Where to Find Free Assets

### 🎵 Sounds
- [Freesound.org](https://freesound.org) - Creative Commons sounds
- [Zapsplat.com](https://www.zapsplat.com) - Free SFX library
- [OpenGameArt.org](https://opengameart.org) - Game-specific assets
- [Pixabay](https://pixabay.com/sound-effects) - Free audio
- [BBC Sound Effects](https://sound-effects.bbcrewind.co.uk) - Public domain

### 🎨 Images & Sprites
- [itch.io](https://itch.io/game-assets) - Huge game asset library
- [OpenGameArt.org](https://opengameart.org) - Game art
- [Pixabay](https://pixabay.com) - Free images
- [Pexels](https://www.pexels.com) - Stock photos
- [Game-Icons.net](https://game-icons.net) - Game icons

### 🔤 Fonts
- [DaFont.com](https://www.dafont.com) - Thousands of fonts
- [Google Fonts](https://fonts.google.com) - Free, open-source fonts
- [FontSpace](https://www.fontspace.com) - Free fonts
- [1001Fonts.com](https://www.1001fonts.com) - Free fonts

---

## ⚡ Quick Start: Add Your First Sound

1. **Download** a sound from [Freesound.org](https://freesound.org)
   - Search: "pong" or "ping" or "hit"
   - Filter: `.wav` or `.ogg` files
   - Download

2. **Save** the file to `/Users/macbook/Pong/assets/sounds/`
   - Example: `paddle_hit.wav`

3. **Add to code** in [main.lua](../main.lua):
   ```lua
   function love.load()
       require("paddle")
       require("ball")
       require("config")
       
       -- ADD THIS LINE:
       paddleSound = love.audio.newSource("assets/sounds/paddle_hit.wav", "static")
       
       -- ... rest of love.load() ...
   end
   ```

4. **Play the sound** in the collision code:
   In [main.lua](../main.lua), find the `updateBall()` function and add:
   ```lua
   -- Paddle 1 collision
   if ball.x - ball.size < paddle1.x + paddle1.width and
      ball.y > paddle1.y and
      ball.y < paddle1.y + paddle1.height then
       ball.dx = math.abs(ball.dx)
       paddleSound:play()  -- ADD THIS LINE
       -- ... rest of collision code ...
   end
   ```

5. **Run the game:**
   ```bash
   love .
   ```

Done! You'll hear the sound when the ball hits the paddle. 🎵

---

## 📋 File Format Support

| Type | Formats |
|------|---------|
| **Audio** | `.ogg`, `.wav`, `.mp3`, `.flac` |
| **Image** | `.png`, `.jpg`, `.gif` |
| **Font** | `.ttf` (TrueType), `.otf` (OpenType) |

---

## 💡 Tips

- Keep sound files small (compressed `.ogg` format is best)
- Use `.png` with transparency for sprites
- Test sound volume levels before adding many sounds
- Keep font files organized by purpose (title, score, etc.)
- Name files clearly (e.g., `paddle_hit.wav` not `sound1.wav`)

---

## 📚 LÖVE 2D Asset Documentation

- [Graphics.newImage](https://love2d.org/wiki/love.graphics.newImage)
- [Audio.newSource](https://love2d.org/wiki/love.audio.newSource)
- [Graphics.newFont](https://love2d.org/wiki/love.graphics.newFont)

---

Enjoy enhancing your Pong game! 🎮
