function ballLoad()
  ball = {}
  
  ball.s = 30
  
  ballReset()
  
  src1 = love.audio.newSource("thwack-02.oga", "static")
  src1:play()
  
  src2 = love.audio.newSource("woosh.wav", "static")
  
  local moveDelay = 0
  --local isInDelay = false
end

local defaultModeDelay = 60
local moveDelay = defaultModeDelay
  
function ballUpdate(dt)
  --moves the ball
  if moveDelay < 1 then
    ball.x = ball.x + ball.xv
    ball.y = ball.y + ball.yv
    paddlesCanMove = true
    --love.window.setPosition( ball.x/4+50, ball.y/4)
  else
    moveDelay = moveDelay - 1
    paddlesCanMove = false
  end
  if drawMenu then
    moveDelay = 0
  end
  
  --print(moveDelay)
  --checks if ball is off screen. If so, reset
  if ball.x + ball.s < 0 then
    ballReset()
    src2:play()
    if scoreMode == 1 then
      p2.score = p2.score + 1
    elseif scoreMode == 2 then
      p1.score = p1.score - 1
    end
  end
  if ball.x > love.graphics.getWidth() then
    ballReset()
    src1:stop()
    src2:play()
    if scoreMode == 1 then
      p1.score = p1.score + 1
    elseif scoreMode == 2 then
      p2.score = p2.score - 1
    end
  end
  
  --checks if the ball is on the floor
  if ball.y + ball.s > love.graphics.getHeight() then
    ball.yv = math.abs(ball.yv)*-1
    ball.y = love.graphics.getHeight()-ball.s-2
    ball.canColOnP1 = true
    src1:stop()
    src1:play()
  end
  
  --checks if the ball is on the ceilling
  if ball.y < 0 then
    ball.yv = ball.yv - ball.yv - ball.yv
    ball.y = 2
    ball.canColOnP1 = true
    src1:stop()
    src1:play()
  end
  
  --checks if the ball is on player one paddle
  if ball.x < p1.x + p1.w and ball.y+ball.s > p1.y and ball.y < p1.y+p1.h and ball.canColOnP1 then
    ball.xv = ball.xv - ball.xv - ball.xv
    ball.yv = math.random(-4, 4)
    --ball.yv = math.random(ball.xv*1, ball.xv)
    --ball.x = p1.x + p1.w + 2
    ball.canColOnP1 = false
    ball.canColOnP2 = true
    src1:stop()
    src1:play()
    if drawMenu and not(love.keyboard.isDown("t")) then return end
    if math.random(1,1) == 1 then ball.xv = ball.xv+0.5 end
  end
  
  --checks if the ball is on player two paddle
  if ball.x+ball.s > p2.x and ball.y+ball.s > p2.y and ball.y < p2.y+p1.h and ball.canColOnP2 then
    --ball.xy = ball.xv + ball.xv + ball.xv + ball.xv
    --ball.xv = 0
    ball.xv = math.abs(ball.xv)*-1
    --ball.yv = math.random(ball.xv*1, ball.xv)
    ball.yv = math.random(-4, 4)
    ball.canColOnP1 = true
    ball.canColOnP2 = false

    src1:stop()
    src1:play()
    if drawMenu and not(love.keyboard.isDown("t")) then return end
    if math.random(1,1) == 1 then ball.xv = ball.xv-0.5 end
    end
end

function ballDraw()
  --love.graphics.setColor( 0, 0, 0)
  --love.graphics.rectangle("fill", ball.x, ball.y, ball.s, ball.s)
  --love.graphics.setColor( 1, 1, 1)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.s, ball.s)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("line", ball.x, ball.y, ball.s, ball.s)
  --love.graphics.setColor(1, 1, 1)
  --love.graphics.print(p1.y)
  --love.graphics.print(ball.xv, 50, 50)
end

function ballSpeedUp()
  --Old, unused code
  if math.random(1,2) == 1 then
    --if 
      ball.xv = ball.xv + 1
    
  end
end
function ballReset()
  
  --sets the ball to default location and velocity
  ball.x = love.graphics.getWidth()/2 - ball.s/2
  ball.y = love.graphics.getHeight()/2 - ball.s/2
  
  ball.xv = -3
  ball.yv = 1
  
  playerReset()
  moveDelay = defaultModeDelay
  ball.canColOnP1 = true
  ball.canColOnP2 = true
end