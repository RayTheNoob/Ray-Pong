function endsL()
  --0 = no winer
  --1 = p1
  --2 = p2
  --3 = you
  --4 = computer
  winner = 0
  
  canPlayEndSound = true
  
  --Great text storage system!
  --textP1Win = {"P", "l", "a", "y", "e", "r", " ", "O", "n", "e", " ", "W", "o", "n", "!"}
  --textP2Win = {"P", "l", "a", "y", "e", "r", " ", "T", "w", "o", " ", "W", "o", "n", "!"}
  --textYouWin = {"Y", "o", "u", " ", "W", "o", "n", "!"}
  --textCompWin = {"C", "o", "m", "p", "u", "t", "e", "r", " ", "W", "o", "n", "!"}
  
  text = {}
  text.P1Win = "Player One Won!"
  text.P2Win = "Player Two Won!"
  text.YouWin = "You Won!"
  text.CompWin = "Computer Won!"
  
  text.PrintText = "Failed ;("
  endCubes = {}
end

function endsU()
  --table.insert(endCubes, 1
end

function endsD()
  if aiMode == 0 then
    if winner == 1 then
      text.PrintText = text.P1Win
    elseif winner == 2 then
      text.PrintText = text.P2Win
    end
  else
    if winner == 1 then
      text.PrintText = text.YouWin
    elseif winner == 2 then
      text.PrintText = text.CompWin
    end
  end
  if winner == 1 or winner == 2 then
    if not(endMusic:isPlaying()) then endMusic:play() end
    love.graphics.setColor( 0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    updateGame = false
    love.graphics.setColor(1,1,1)
    cText("Press 'esc' to return to menu", love.graphics.getHeight()- 100)
    love.graphics.print(tostring(text.PrintText), font2, love.graphics.getWidth()/2-font:getWidth(text.PrintText)/2, 100)
    --love.event.quit()
    if canPlayEndSound then
      LoseSound:play()
      canPlayEndSound = false
    end
  --love.graphics.print(textCompWin)
  end

  --Draw Nice Cubes
end