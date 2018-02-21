  -- Space background spritesheets
  spaceFramesWhole = love.graphics.newImage("assets/sheets/Space Sprite Sheet/spcebg.png")
  spaceFrameWidth = spaceFramesWhole:getWidth() / 4
  spaceFrameHeight = spaceFramesWhole:getHeight()
  spaceFrame1 = love.graphics.newQuad(0, 0, spaceFrameWidth, spaceFrameHeight, spaceFramesWhole:getDimensions())
  spaceFrame2 = love.graphics.newQuad(spaceFrameWidth, 0, spaceFrameWidth, spaceFrameHeight, spaceFramesWhole:getDimensions())
  spaceFrame3 = love.graphics.newQuad(spaceFrameWidth * 2, 0, spaceFrameWidth, spaceFrameHeight, spaceFramesWhole:getDimensions())
  spaceFrame4 = love.graphics.newQuad(spaceFrameWidth * 3, 0, spaceFrameWidth, spaceFrameHeight, spaceFramesWhole:getDimensions())
  spaceFrameQuads = { [1] = spaceFrame1, [2] = spaceFrame2, [3] = spaceFrame3, [4] = spaceFrame4 }
  
  
  
  -- Loading spritesheets into variables
  lCharacter = love.graphics.newImage("assets/sheets/Character Sheets/Walking/Left/Lwlkcycl.png")
  rCharacter = love.graphics.newImage("assets/sheets/Character Sheets/Walking/Right/Rwlkcycl.png")
  iLcharacter = love.graphics.newImage("assets/sheets/Character Sheets/Idle/Left/idleLsp.png")
  iRcharacter = love.graphics.newImage("assets/sheets/Character Sheets/Idle/Right/idleRsp.png")
  
  charSheetWidth = lCharacter:getWidth()  -- gets width of spritesheet (uniform for running L/R)
  spriteWidth = charSheetWidth / 8   -- gives the width of one frame of the spritesheet, stores in variable for quads
  iCharSheetWidth = iLcharacter:getWidth()  -- half of the width of running spritesheet
  iSpriteWidth = iCharSheetWidth / 4  -- same as above, width of one frame of idle spritesheet for quads
  
  spriteHeight = lCharacter:getHeight()  -- height of a sprite, same as height of spritesheet (only one row)
  
  -- Initializing quads
  lWlk0 = love.graphics.newQuad(0, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk1 = love.graphics.newQuad(spriteWidth, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk2 = love.graphics.newQuad(spriteWidth * 2, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk3 = love.graphics.newQuad(spriteWidth * 3, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk4 = love.graphics.newQuad(spriteWidth * 4, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk5 = love.graphics.newQuad(spriteWidth * 5, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk6 = love.graphics.newQuad(spriteWidth * 6, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  lWlk7 = love.graphics.newQuad(spriteWidth * 7, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  -- Table of quads   lCharQuads[1] is like saying lWlk0, etc.
  lCharQuads = { [1] = lWlk0, [2] = lWlk1, [3] = lWlk2, [4] = lWlk3, [5] = lWlk4, [6] = lWlk5, [7] = lWlk6, [8] = lWlk7 }

  -- Same for idle frames
  lIdl0 = love.graphics.newQuad(0, 0, iSpriteWidth, spriteHeight, iLcharacter:getDimensions())
  lIdl1 = love.graphics.newQuad(spriteWidth, 0, iSpriteWidth, spriteHeight, iLcharacter:getDimensions())
  lIdl2 = love.graphics.newQuad(spriteWidth * 2, 0, iSpriteWidth, spriteHeight, iLcharacter:getDimensions())
  lIdl3 = love.graphics.newQuad(spriteWidth * 3, 0, iSpriteWidth, spriteHeight, iLcharacter:getDimensions())
  iLidlQuads = { [1] = lIdl0, [2] = lIdl1, [3] = lIdl2, [4] = lIdl3 }
  
  rIdl0 = love.graphics.newQuad(0, 0, iSpriteWidth, spriteHeight, iRcharacter:getDimensions())
  rIdl1 = love.graphics.newQuad(iSpriteWidth, 0, iSpriteWidth, spriteHeight, iRcharacter:getDimensions())
  rIdl2 = love.graphics.newQuad(iSpriteWidth * 2, 0, iSpriteWidth, spriteHeight, iRcharacter:getDimensions())
  rIdl3 = love.graphics.newQuad(iSpriteWidth * 3, 0, iSpriteWidth, spriteHeight, iRcharacter:getDimensions())
  iRidlQuads = { [1] = rIdl0, [2] = rIdl1, [3] = rIdl2, [4] = rIdl3 }
  
  rWlk0 = love.graphics.newQuad(0, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk1 = love.graphics.newQuad(spriteWidth, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk2 = love.graphics.newQuad(spriteWidth * 2, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk3 = love.graphics.newQuad(spriteWidth * 3, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk4 = love.graphics.newQuad(spriteWidth * 4, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk5 = love.graphics.newQuad(spriteWidth * 5, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk6 = love.graphics.newQuad(spriteWidth * 6, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rWlk7 = love.graphics.newQuad(spriteWidth * 7, 0, spriteWidth, spriteHeight, rCharacter:getDimensions())
  rCharQuads = { [1] = lWlk0, [2] = lWlk1, [3] = lWlk2, [4] = lWlk3, [5] = lWlk4, [6] = lWlk5, [7] = lWlk6, [8] = lWlk7 }
  
-- Collision detection function.  from https://love2d.org/wiki/BoundingbugBox.lua
-- Returns true if two bugBoxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first bugBox, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second bugBox
function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

bugImg = love.graphics.newImage("assets/tempBugs.png")
bugImgSprayed = love.graphics.newImage("assets/tempBugsSprayed.png")
bugImgWidth = bugImg:getWidth()

bug = { img = bugImg, x = 100, y = 100, d = 0, isSprayed = false }
bug2 = { img = bugImg, x = 1895, y = 4190, d = 0, isSprayed = false }
bug3 = { img = bugImg, x = 100, y = 2000, d = 0, isSprayed = false }
bug4 = { img = bugImg, x = 1950, y = 3350, d = 0, isSprayed = false }
bug5 = { img = bugImg, x = -900, y = 4000, d = 0, isSprayed = false }
bug6 = { img = bugImg, x = -100, y = 1500, d = 0, isSprayed = false }
--bug7 = { img = bugImg, x = 1200, y = 5000, d = 0, isSprayed = false }
bug8 = { img = bugImg, x = 1000, y = 400, d = 0, isSprayed = false }
bugs = { }
table.insert(bugs, bug);
table.insert(bugs, bug2);
table.insert(bugs, bug3);
table.insert(bugs, bug4);
table.insert(bugs, bug5);
table.insert(bugs, bug6);
--table.insert(bugs, bug7);
table.insert(bugs, bug8);

function love.load()
  bugBox = false
  shipBox = false
  inShip = false
  dead = false
  intro = true
  introTimer = 5
  inShipTimerCurr = 0
  inShipTimerMax = 3
  oxygen = 100
  lowOxygenFilter = false
  lowOxyColorUp = true
  lowOxyValue = 0
  lowOxyValueFloor = 50
  lowOxyValueTimer = 0
  lowOxyAlpha = 0
  lowOxyAlertSpeed = 200  -- multiplied by dt to decide alert speed, increases when close to death
  location = 0
  location = 0
  location = 0
  
  -- Load world map
  map = love.graphics.newImage("assets/worldmap.png")
  test = love.graphics.newImage("assets/Animation Frames/Character/Moving/Moving Left/Walk Cycle 64 4_Animation 1_0.png")
  
  -- Sets resolution to size of desktop, fullscreen is on
  love.window.setMode(0, 0, {fullscreen = true})
  screenWidth, screenHeight = love.graphics.getDimensions();
  charSprite = love.graphics.newQuad(0, 0, spriteWidth, spriteHeight, lCharacter:getDimensions())
  
  --initialize idleFrameTime
  idleFrameTime = 0
  
  --initialize charQuadIndex
  charQuadIndex = 1
  spaceQuadIndex = 1
  spaceIdleTime = 0
  introImgScalar = screenHeight / spaceFrameHeight
  introImgPadding = (screenWidth - (spaceFrameWidth * introImgScalar)) / 2
  
  --Sets the character to draw in the middle of the screen 
  charY = (love.graphics.getHeight() / 2) - (lCharacter:getHeight() / 2)
  charX = love.graphics.getWidth() / 2 - (lCharacter:getWidth() / 8) + 40
  
  -- Sets the character to draw by the ship
  mapY = -1132
  mapX = -3500
  LRflag = false -- FALSE = facing LEFT, TRUE = facing RIGHT
end

function atShip() -- -3460 -3550 n-1030 -1240
  return (mapX > -3550) and (mapX < -3460)
    and (mapY > -1240) and (mapY < -1030)
end

function dist(x1, y1, x2, y2)
  return math.abs(((x2-x1) ^ 2 + (y2-y1) ^ 2) ^ 0.5)
end

function findIndexOfClosestBug()
  if #bugs == 1 then
    return 1
  end
  indexOfClosestBug = 1
  for i = 2, #bugs do
    if (bugs[i].d <= bugs[indexOfClosestBug].d) then
      indexOfClosestBug = i
    end
  end
  return indexOfClosestBug
end

function clearBugTable()
  bug = { img = bugImg, x = 100, y = 100, d = 0, isSprayed = false }
  bug2 = { img = bugImg, x = 1895, y = 4190, d = 0, isSprayed = false }
  bug3 = { img = bugImg, x = 100, y = 2000, d = 0, isSprayed = false }
  bug4 = { img = bugImg, x = 1950, y = 3350, d = 0, isSprayed = false }
  bug5 = { img = bugImg, x = -900, y = 4000, d = 0, isSprayed = false }
  bug6 = { img = bugImg, x = -100, y = 1500, d = 0, isSprayed = false }
  --bug7 = { img = bugImg, x = 1200, y = 5000, d = 0, isSprayed = false }
  bug8 = { img = bugImg, x = 1000, y = 400, d = 0, isSprayed = false }
  bugs = { }
  table.insert(bugs, bug);
  table.insert(bugs, bug2);
  table.insert(bugs, bug3);
  table.insert(bugs, bug4);
  table.insert(bugs, bug5);
  table.insert(bugs, bug6);
  --table.insert(bugs, bug7);
  table.insert(bugs, bug8);
end

function love.keypressed(key)
  if (key == 'q') or (key == 'escape') then
    os.exit()
  end
  if (key == 'space') then
    intro = false
    if dead then
      dead = false
      oxygen = 100
      lowOxygenFilter = false
      mapY = -1132
      mapX = -3500
      clearBugTable()
      for k, v in pairs(bugs) do
        v.isSprayed = false
        v.img = bugImg
      end
    end
  end
  if (key == 'o') then  -- for debug purposes only
    if oxygen < 25 then
      oxygen = 11
    else
      oxygen = 26
      lowOxygenFilter = false
      lowOxyAlpha = 0
      alphaReady = false
    end
  end
  if (key == 'b') then  -- for debug purposes only
    newBug = { img = bugImg, x = 100 + math.random(1, 100), y = 100 + math.random(1, 100), d = 0, isSprayed = false }
    table.insert(bugs, newBug)
  end
  if (key == 'e') or (key == 'return') then
    -- player selecting a choice: location 0 is "spray the bugs" location 1 is "leave the bugs"
    if bugBox then
      -- if SPRAY THE BUGS!
      if location == 0 then
        for k, v in pairs(bugs) do
          if collidingWithBug(charX, charY) then
            indexOfClosestBug = findIndexOfClosestBug()
            bugs[indexOfClosestBug].img = bugImgSprayed
            bugs[indexOfClosestBug].isSprayed = true
          end
        end
        --bugsKilled = true
      else
        location = 0   -- reset position cursor
      end
      bugBox = false
    elseif (collidingWithBug(charX, charY)) then -- there was no text box open
      bugBox = true
    end
    
    if shipBox then
      if location == 0 then
        inShip = true
        inShipTimerCurr = inShipTimerMax
        local i = 1
        if #bugs == 1 and bugs[1].isSprayed then
          bugs = {}
        end
        while (i <= #bugs) do
          print("entering removal loop, i = " .. i .. "  bugs size = " .. #bugs)
          if bugs[i].isSprayed then
            print("i = " .. i .. " REMOVING BUG, CURR BUGS SIZE: " .. #bugs)
            table.remove(bugs, i)
            i = i - 1
            print("i = " .. i .. " REMOVED BUG, NEW BUGS SIZE: " .. #bugs)
          end
          i = i + 1
          indexOfClosestBug = findIndexOfClosestBug()
        end
      else
        location = 0
      end
      shipBox = false
    elseif (atShip()) then
      shipBox = true
    end
  end
end

--iterate through 'bugs' table and check for collision based on width
function collidingWithBug(nextCharX, nextCharY)
  
  for k, v in pairs(bugs) do
    if checkCollision(v.x, v.y, bugImgWidth, bugImgWidth, nextCharX, nextCharY, spriteWidth, spriteHeight) then
      
      return true
    end
  end
  return false
end

  
  
  
function love.update(dt)
  
  if oxygen <= 0 then
    dead = true
  end
  
  if oxygen > 25 then
    lowOxygenFilter = false
  end
  
  if ((spaceIdleTime > 0.5) and intro) then
    spaceIdleTime = 0
    if spaceQuadIndex < 4 then
      spaceQuadIndex = spaceQuadIndex + 1
    else
      spaceQuadIndex = 1
    end
  end
  
  if intro then
    spaceIdleTime = spaceIdleTime + dt
    return
  end
  
  if oxygen < 25 then
    lowOxygenFilter = true
  end
  
  if oxygen < 10 then
    if lowOxyAlertSpeed < 350 then
      lowOxyAlertSpeed = lowOxyAlertSpeed + dt * (100)
    end
    if lowOxyAlpha < 80 then
      lowOxyAlpha = lowOxyAlpha + dt * (lowOxyAlertSpeed - 50)
    end
  end
  
  if oxygen < 5 then
    if lowOxyAlertSpeed < 450 then
      lowOxyAlertSpeed = lowOxyAlertSpeed + dt * 50
    end
    if lowOxyValueFloor < 100 then
      lowOxyValueFloor = lowOxyValueFloor + dt * 50
    end
    if lowOxyAlpha < 110 then
      lowOxyAlpha = lowOxyAlpha + dt * (lowOxyAlertSpeed - 100)
    end
  end
  
  if lowOxygenFilter then
    -- ramp up the alpha to desired level so transition to low oxy is less jarring
    -- comment out this if block to see what I mean
    if lowOxyAlpha < lowOxyValueFloor then
      lowOxyAlpha = lowOxyAlpha + dt * lowOxyAlertSpeed
    end
    
    if lowOxyColorUp then
      lowOxyValue = lowOxyValue + dt * lowOxyAlertSpeed
      if lowOxyValue > 255 then
        lowOxyColorUp = false
      end
    else
      lowOxyValue = lowOxyValue - dt * lowOxyAlertSpeed
      if lowOxyValue < lowOxyValueFloor then
        lowOxyColorUp = true
      end
    end
  end
  
  inBox = false
  if inShip then
    oxygen = 100
    if inShipTimerCurr <= 0 then
      inShip = false
    else
      inShipTimerCurr = inShipTimerCurr - dt
    end
  end
  
  if bugBox or shipBox or inShip then
    inBox = true
  end
  if bugBox then
    if love.keyboard.isDown('down') then
      location = 1
    end
    if love.keyboard.isDown('up') then
      location = 0
    end
  end
  if shipBox then
    if love.keyboard.isDown('down') then
      location = 1
    end
    if love.keyboard.isDown('up') then
      location = 0
    end
  end
  
  -- Time for sprite animation, dt is time since last call
  idleFrameTime = idleFrameTime + dt
  
  if not running then
    movingRight = false
    movingLeft = false
  end
  
  -- set running to false; it will stay false if no key is pressed, if any key is pressed it is set to be true
  running = false
  if (not inBox) then
    oxygen = oxygen - dt;
    for k, v in pairs(bugs) do
      v.d = dist(charX, charY, v.x, v.y)
    end
    indexOfClosestBug = findIndexOfClosestBug()

    if love.keyboard.isDown('down') then
        mapY = mapY - 4
        for k, v in pairs(bugs) do
          v.y = v.y - 4
        end
      running = true
    
      --LRflag represents the last direction you were facing so the corresponding idle animation is played
      if LRflag then
        movingRight = true
        movingLeft = false
      end
      if (not LRflag) then
        movingLeft = true
        movingRight = false
      end
    
    end
    if love.keyboard.isDown('up') then
      --if (not collidingWithBug(charX, charY - 5)) then
        mapY = mapY + 4
        for k, v in pairs(bugs) do
          v.y = v.y + 4
        end
      --end

      running = true
      movingRight = true
      movingLeft = false
      
      --LRflag represents the last direction you were facing so the corresponding idle animation is played
      if LRflag then
        movingRight = true
        movingLeft = false
      end
      if (not LRflag) then
        movingLeft = true
        movingRight = false
      end
    end
    if love.keyboard.isDown('left') then
        mapX = mapX + 4
        for k, v in pairs(bugs) do
          v.x = v.x + 4
        end
    movingRight = false
    movingLeft = true
    running = true
    LRflag = false
  end
  if love.keyboard.isDown('right') then
    movingLeft = false
    movingRight = true
      mapX = mapX - 4 -- change back to - 4
      for k, v in pairs(bugs) do
        v.x = v.x - 4
      end
    running = true
    LRflag = true
  end
end
  
                    --VV change value to change run cycle speed (bigger number = slower)
  if (idleFrameTime > 0.1 and running) then
    idleFrameTime = 0
    if charQuadIndex < 9 then
      charQuadIndex = charQuadIndex + 1
    end
    if charQuadIndex == 9 then
      charQuadIndex = 1
    end
  end
  
                      -- VV change value to change idle cycle speed (bigger number = slower)
  if ((idleFrameTime > 0.25) and (not running)) then
    idleFrameTime = 0
    if charQuadIndex < 5 then
      charQuadIndex = charQuadIndex + 1
    end
    if charQuadIndex == 5 then
      charQuadIndex = 1
    end
  end
end



function love.draw()
  love.graphics.setColor(255, 255, 255, 255)
  
  if dead then
    love.graphics.printf("y o u ' r e   d e a d \n p r e s s   s p a c e   t o   s t a r t   o v e r",
      screenWidth / 2 - 140, screenHeight / 2, 260, 'center')
    return
  end
  
  if intro then
    love.graphics.draw(spaceFramesWhole, spaceFrameQuads[spaceQuadIndex], introImgPadding, 0, 0, introImgScalar)
    love.graphics.print("p r e s s   s p a c e   b u t t o n   t o   s t a r t", 
      screenWidth / 2 - spaceFrameWidth / 4, spaceFrameHeight * introImgScalar * 0.97)
    return
  end
  
  if inShip then
    love.graphics.draw(spaceFramesWhole, spaceFrameQuads[spaceQuadIndex], introImgPadding, 0, 0, introImgScalar)
    return
  end
  
  love.graphics.draw(map, mapX, mapY)
  
  
  for k, v in pairs(bugs) do
    love.graphics.draw(v.img, v.x, v.y)
  end
  
  --love.graphics.print("oxygen " .. oxygen, 200, 200)
  --love.graphics.print("width, height " .. screenWidth .. " " .. screenHeight, 200, 215)
  --love.graphics.print("lowOxyValue " .. lowOxyValue .. " " .. lowOxyValueTimer, 200, 230)

  if movingLeft then
    love.graphics.draw(lCharacter, lCharQuads[charQuadIndex], charX, charY)
  end
  if movingRight then
    love.graphics.draw(rCharacter, rCharQuads[charQuadIndex], charX, charY)
  end
  if (not running) then
    if charQuadIndex > 4 then
      charQuadIndex = 1
    end
    if LRflag then
      love.graphics.draw(iRcharacter, iRidlQuads[charQuadIndex], charX, charY)
    end
    if (not LRflag) then
      love.graphics.draw(iLcharacter, iLidlQuads[charQuadIndex], charX, charY)
    end
  end
  love.graphics.print(mapX .. ", " .. mapY, 0, 0)
  love.graphics.print("bugs remaining: " .. #bugs, 0, 40)
  if bugs[1] ~= nil  and (not intro) then
    --love.graphics.print(indexOfClosestBug .. " " .. #bugs .. bugs[indexOfClosestBug].d, 0, 30)
  end
  if collidingWithBug(charX, charY) then
    love.graphics.setColor(255, 10, 0)
    love.graphics.print("COLLIDING", 0, 10)
  end
  if atShip() then
    love.graphics.setColor(255, 10, 0)
    love.graphics.print("AT SHIP", 0, 20)
  end
  if bugBox and (not bugs[indexOfClosestBug].isSprayed) then 
    love.graphics.rectangle("fill", 400, 400, 200, 100)
    love.graphics.setColor(50, 50, 50)
    love.graphics.print("k i l l  t h e  b u g s", 440, 420)
    love.graphics.print("l e a v e  t h e  b u g s", 440, 460)
    love.graphics.print(">", 420, 420 + (location * 40))
  end
  if bugBox and bugs[indexOfClosestBug].isSprayed then
    love.graphics.rectangle("fill", 400, 400, 200, 100)
    love.graphics.setColor(50, 50, 50)
    love.graphics.print("you have already sprayed \n the bugs", 420, 440)
  end
  if shipBox and (not inShip) then 
    love.graphics.rectangle("fill", 400, 400, 200, 100)
    love.graphics.setColor(50, 50, 50)
    love.graphics.print("r e t u r n  t o  s h i p", 440, 420)
    love.graphics.print("s t a y", 440, 460)
    love.graphics.print(">", 420, 420 + (location * 40))
  end
  
  
  oxyBarWidth = screenWidth * (2/3)
  oxyBarHeight = screenHeight / 20
  oxyBarX = screenWidth / 6
  oxyBarY = screenHeight - (screenHeight / 20)
  love.graphics.setColor(10, 255, 150, 200)
  love.graphics.rectangle("fill", oxyBarX, oxyBarY, oxyBarWidth, oxyBarHeight)
  
  missingBarX = (oxyBarX + oxyBarWidth) - (oxyBarWidth * ((100 - oxygen) / 100))
  missingBarWidth = oxyBarWidth * ((100 - oxygen) / 100)
  love.graphics.setColor(255, 50, 0, 255)
  love.graphics.rectangle("fill", missingBarX, oxyBarY, missingBarWidth, oxyBarHeight)
  
  if lowOxygenFilter then
    love.graphics.setColor(lowOxyValue, 0, lowOxyValue / 3, lowOxyAlpha)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getDimensions())
  end
  
  
  
  --love.graphics.draw(bug.img, -3000, -1000)
  --love.graphics.draw(bugImg, -3000, -1000)
  --love.graphics.draw(bugImg, -1000, -3000)
  --love.graphics.draw(bugImg, 100, 100)
end