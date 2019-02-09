-- Constants
local GAME_WIDTH = 200
local GAME_HEIGHT = 200
local RENDER_SCALE = 3

-- Game vars
-- ...

-- Game objects
-- ...

-- Images
local boidsImage

-- Sound effects
-- ...

-- Initializes the game
function love.load()
  -- Load images
  boidsImage = loadImage('img/boids.png')

  -- Load sound effects
  -- ...

  -- Create the game objects
  -- ...
end

-- Updates the game state
function love.update(dt)
  -- ...
end

-- Renders the game
function love.draw()
  -- Set some drawing filters
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.graphics.scale(RENDER_SCALE, RENDER_SCALE)

  -- Clear the screen
  love.graphics.setColor(0 / 255, 0 / 255, 0 / 255, 1)
  love.graphics.rectangle('fill', 0, 0, GAME_WIDTH, GAME_HEIGHT)
end

-- Click to spawn more lil' boids
function love.mousepressed()
  -- ...
end

-- Loads a pixelated image
function loadImage(filePath)
  local image = love.graphics.newImage(filePath)
  image:setFilter('nearest', 'nearest')
  return image
end

-- Draws a sprite from a sprite sheet image, spriteNum=1 is the upper-leftmost sprite
function drawSprite(image, spriteNum, spriteWidth, spriteHeight, flipHorizontally, x, y)
  local columns = math.floor(image:getWidth() / spriteWidth)
  local col = (spriteNum - 1) % columns
  local row = math.floor((spriteNum - 1) / columns)
  local quad = love.graphics.newQuad(spriteWidth * col, spriteHeight * row, spriteWidth, spriteHeight, image:getDimensions())
  love.graphics.draw(image, quad, x + (flipHorizontally and spriteWidth or 0), y, 0, flipHorizontally and -1 or 1, 1)
end
