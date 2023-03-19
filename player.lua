function playerLoad()
  
  --score mode
  --1 counts up to ten
  --2 counts down from three
  --3 unlimited
  --scoreMode = 1
  -- if scoreMode == 3 then

  --end
  
  pSpeed = 3
  vMargin = 15
  
  aiSwitchTimer = 30
  
  p1 = {}
  p2 = {}
  
  ofsetFromEdge = 15
    
  playerReset()
  
  if scoreMode == 1 then
    p1.score = 0
    p2.score = 0
  end
  if scoreMode == 2 then
    p1.score = 3
    p2.score = 3
  end
end
function playerUpdate(dt)
  if paddlesCanMove then
  --p1.y = p1.y + 1
  --p2.y = p2.y -1
    if love.keyboard.isDown("w") then
      if p1.y > vMargin then
        p1.y = p1.y - pSpeed
      end
    end
    
    if love.keyboard.isDown("s") then
      if p1.y + p1.h < love.graphics.getHeight() - vMargin then
        p1.y = p1.y + pSpeed
      end
    end
    
    if love.keyboard.isDown("up") then
      if aiMode == 0 then
        if p2.y > vMargin then
          p2.y = p2.y - pSpeed
        end
      end
    end
    
    if love.keyboard.isDown("down") then
      if aiMode == 0 then
        if p2.y + p1.h < love.graphics.getHeight() - vMargin then
          p2.y = p2.y + pSpeed
        end
      end
    end
    
    --AI updating
    --Best If staitments ever!
    if aiMode == 3 then
      p2.y = ball.y-p1.h/2 + ball.s/2
    end
    if aiMode == 4 then
      p2.y = ball.y-p1.h/2 + ball.s/2
      p1.y = ball.y-p1.h/2 + ball.s/2
    end
    if aiMode == 2 then
      --if ball.x > love.graphics.getWidth()/2 then
      --if aiSwitchTimer > 1 then
        --aiSwitchTimer = aiSwitchTimer - 1
      --else
        --aiSwitchTimer = 3
      --end
        if ball.y-ball.s/2 < p1.h/2+p2.y then
          p2.y = p2.y - pSpeed
        end
        if ball.y-ball.s/2 > p1.h/2+p2.y then
          p2.y = p2.y + pSpeed
        end
        if p2.y < vMargin then
          p2.y = vMargin
        end
        if p2.y > love.graphics.getHeight()+p1.h+vMargin then
          p2.y = love.graphics.getHeight()-vMargin
        end
      --end
    end
    if aiMode == 1 then
      if ball.y < p2.y then
        if p1.h+p2.y > love.graphics.getHeight() then
          p2.y = p2.y + pSpeed
        end
      end
      if ball.y > p2.y then
        if p2.y > vMargin then
          p2.y = p2.y - pSpeed
        end
      end
    end
  end
end

function playerDraw()
  love.graphics.rectangle("line", p1.x, p1.y, p1.w, p1.h)
  love.graphics.rectangle("line", p2.x, p2.y, p1.w, p1.h)
  love.graphics.print(aiSwitchTimer)
end

function playerReset()
  
  
  p1.w = 30
  p1.h = 125
  
  p2.w = p2.w
  p2.h = p1.h
  
  --p1.y = p1.h/2
  --p2.y = p2.h/2
    
  p1.x = ofsetFromEdge
  p2.x = love.graphics.getWidth() - ofsetFromEdge - p1.w
  
  p1.y = love.graphics.getHeight()/2 - p1.h/2
  p2.y = love.graphics.getHeight()/2 - p2.h/2

end

function backToMenu()
  updateMenu = true
  drawMenu = true
  aiMode = 4
  menuL()
end