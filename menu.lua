function menuL()
  font2 = love.graphics.newFont("Roboto.ttf", 70, "normal", 1 )
  font3 = love.graphics.newFont("Roboto.ttf", 30, "normal", 1 )
  font4 = love.graphics.newFont("Roboto.ttf", 15, "normal", 1 )
  
  buttonY = {120, 170, 270, 320, 370, 470, 520, 570}
  buttonYlength = 8
  buttonYpos = 1
  
  keyCanBePressed = true
  keyCanBePressed2 = true
  
  menuAIconv = { 0, 0, 1, 2, 3}
  menuScoreconv = { 0, 0, 0, 0, 0, 1, 2, 3}
  
  src7 = love.audio.newSource("click.wav", "static")
  src8 = love.audio.newSource("select.ogg", "static")
  
  menuYoffset = love.graphics.getHeight()
  winner = 0
  
  p1.score = 0
  p2.score = 0
  
  menuFadeOut = 0
  
  updateGame = true
  
  winner = 0
  
  scoreMode = 1
  
end

function menuU(dt)
  --if not(buttonYpos == 0) then
    --isEscing = false
  --end
  if isEscing then
    if menuYoffset == 0 then
      menuFadeOut = menuFadeOut + 0.02
      if menuFadeOut > 1.5 then
        print("Thanks for playing! Goodbye!")
        love.event.quit()
      end
    end
  end  
  --if drawMenu == false then
    --print("1")
    --if love.keyboard.isDown('P') then
      --updateGame = false
      --print("2")
    --end
  --end
  --if love.mouse.isDown(1) then
    --love.event.quit()
    --print(love.mouse.getX())
    --if love.mouse.getX() < 290 and love.mouse.getX() > 500 then
      --love.event.quit()
      --print("w")
    --end
    --if checkClick(310, 50, 480, 300) then
      --love.event.quit()
    --end
  --I know that is a very bad way doing this
  if menuCanScroll then
    menuYoffset = menuYoffset - 4
  else
    menuYoffset = 0
  end
  if menuYoffset < 0 then
    menuYoffset = 0
  end
  if love.keyboard.isDown("down") and keyCanBePressed == true then
    buttonYpos = buttonYpos + 1
    keyCanBePressed = false
    src7:play()
    if buttonYpos == 9 then
      buttonYpos = 1
    end
  end
  if not love.keyboard.isDown("down") then
    keyCanBePressed = true
  end
  
  if love.keyboard.isDown("up") and keyCanBePressed2 == true then
    buttonYpos = buttonYpos - 1
    keyCanBePressed2 = false
    src7:play()
    if buttonYpos == 0 then
      buttonYpos = 8
    end
  end
  if not love.keyboard.isDown("up") then
    keyCanBePressed2 = true
  end
  
  if love.keyboard.isDown("return") then
    if buttonYpos == 1 then
      if menuMusic:isPlaying() then menuMusic:stop() end
      printGame()
      menuCanScroll = false
      --aiMode = 0
      --menuScore = menuAIconv[menuAI]
      --scoreMode = menuScoreconv[menuScore]
      --print(menuAIconv[menuAI])
      updateMenu = false
      drawMenu = false
      setAI()
      setScoreMode()
      --aiMode = 0
      --src8:stop()
      src8:play()
      setAI()
      playerLoad()
      ballLoad()
      ballReset()
      playerReset()
      printGame()
    end
  end
  if love.keyboard.isDown("return") then
    --src8:stop()
    src8:play()
    if buttonYpos == 2 then
      if menuMusic:isPlaying() then menuMusic:stop() end
      menuCanScroll = false
      --aiMode = 0
      --menuScore = menuAIconv[menuAI]
      --scoreMode = menuScoreconv[menuScore]
      --print(menuAIconv[menuAI])
      updateMenu = false
      drawMenu = false
      setAI()
      setScoreMode()
      aiMode = 0
      playerLoad()
      ballLoad()
      ballReset()
      playerReset()
      printGame()
    end
  end
  
  if love.keyboard.isDown("return") and buttonYpos > 2 then
    --love.event.quit()
    --src8:stop()
    src8:play()
    if buttonYpos > 2 and buttonYpos < 6 then
      menuAI = buttonYpos
      --src8:stop()
      src8:play()
    end
    if buttonYpos > 5 and buttonYpos < 9 then
      menuScore = buttonYpos
      --src8:stop()
      src8:play()
    end

  end
end

function menuD()
  love.graphics.setColor( 0, 0, 0, 0.7)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
  love.graphics.setColor( 1, 1, 1)
  --love.graphics.print(tostring(love.getVersion()))
  love.graphics.translate(0,menuYoffset)
  love.graphics.print(tostring("RayPong"), font2, love.graphics.getWidth()/2-font:getWidth("RayPong")/2)
  --print(love.graphics.getWidth())
  sText("Enjoy!", 75)
  cText("1 Player", 100)
  cText("2 Player", 150)
  
  sText("Pick AI mode", 225)
  cText("Useless", 250)
  cText("Normal", 300)
  cText("Unfair", 350)
  
  
  sText("Pick scoring mode", 425)
  cText("Classic", 450)
  cText("3 Lives", 500)
  cText("Unlimited", 550)
  
  --love.graphics.print(love.mouse.getX())
  --love.graphics.print(love.mouse.getY(), 50, 0)
  --love.graphics.print(buttonYpos)
  love.graphics.print(">", font3, love.graphics.getWidth()/2-100, buttonY[buttonYpos]-25)
  
  love.graphics.rectangle("line", love.graphics.getWidth()/2-75, buttonY[menuAI]-22, 75*2, 40)
  love.graphics.rectangle("line", love.graphics.getWidth()/2-75, buttonY[menuScore]-22, 75*2, 40)
  
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.print("Navigate menu with arrow keys and enter", 5, love.graphics.getHeight()-125)
  love.graphics.print("Player one use W and S", 5, love.graphics.getHeight()-100)
  love.graphics.print("Player two use up and down arrow keys", 5, love.graphics.getHeight()-75)
  love.graphics.print("Press escape to return to menu/quit", 5, love.graphics.getHeight()-50)
  love.graphics.print("Game made by Ray", 5, love.graphics.getHeight()-25)
  --if love.graphics.getWidth == 800 and love.graphics.getHeight == 600 then
    --love.graphics.print("WARNING! Window size not supported", 5, love.graphics.getHeight()-125)
  --end
  love.graphics.print("This game is kinnda broken. Sorry", 5, love.graphics.getHeight()-150)
  love.graphics.print("Don't resize this window, it can break things", 5, love.graphics.getHeight()-175)
  love.graphics.print(verName, love.graphics.getWidth()-DFONT:getWidth(verName), love.graphics.getHeight()-DFONT:getHeight(verName))
  love.graphics.translate(0,0)
  
  love.graphics.setColor( 0, 0, 0, menuFadeOut)
  love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
end

function cText(inp, ypos)
  love.graphics.print(tostring(inp), font3, love.graphics.getWidth()/2-font3:getWidth(inp)/2, ypos)
end

function sText(inp, ypos)
  love.graphics.print(tostring(inp), font4, love.graphics.getWidth()/2-font4:getWidth(inp)/2, ypos)
end

function checkClick(x1, y1, x2, y2)
  local mx = love.mouse.getX()
  local my = love.mouse.getY()
  if love.mouse.getX() < x1 and love.mouse.getX() > x2 then
    return(true)
  else
    return(false)
  end
end

function setAI()
  if menuAI == 3 then
    aiMode = 1
  elseif menuAI == 4 then
    aiMode = 2
  elseif menuAI == 5 then
    aiMode = 3
  end
end

function setScoreMode()
  if menuScore == 6 then
    scoreMode = 1
  elseif menuScore == 7 then
    scoreMode = 2
  elseif menuScore == 8 then
    scoreMode = 3
  end
end

function printGame()
  --print("New game started. Settings: "..buttonYpos.."-"..aiMode.."-"..scoreMode)
  return
end