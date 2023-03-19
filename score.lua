function scoreL()
  font = love.graphics.newFont("Roboto.ttf", 75, "normal", 1 )
end

function scoreU(dt)
  if scoreMode == 1 then
    if p1.score > 9 then
      winner = 1
      canPlayEndSound = true
    end
    if p2.score > 9 then
      winner = 2
      canPlayEndSound = true
    end
  end
  
  if scoreMode == 2 then
    if p1.score == 0 then
      winner = 2
      canPlayEndSound = true
    end
    if p2.score == 0 then
      winner = 1
      canPlayEndSound = true
    end
  end
end

function scoreD()
  if not drawMenu then
    if scoreMode == 1 or scoreMode == 2 then
      love.graphics.print( tostring(p1.score), font, love.graphics.getWidth()/4, 50)
      love.graphics.print( tostring(p2.score), font, love.graphics.getWidth()/4*3, 50)
      --love.graphics.print( tostring(p2.score), font, love.graphics.getWidth()/2+150-font:getWidth(p2.score), 50)
      --love.graphics.print( tostring(p1.score), font, font:getWidth(p1.score)+love.graphics.getWidth()/6, 50)
      --love.graphics.print( tostring(p2.score), font, font:getWidth(p2.score)+love.graphics.getWidth()-love.graphics.getWidth()/4, 50)
    end
  end
end