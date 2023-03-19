function lineLoad()
  line = {}
  line.whiteSize = 15
  line.blackSize = line.whiteSize
  line.x = love.graphics.getWidth()/2
  
  scrollOfset = 0
end

function lineDraw()
  --if moveDelay < 1 then
    line.x = love.graphics.getWidth()/2
    topPos = scrollOfset
    --scrollOfset = scrollOfset + 0.2
    if scrollOfset > line.whiteSize*2 then
      scrollOfset = 0
    end
    --scrollOfset = love.mouse.getY()/line.whiteSize
  local bottomPos = topPos + line.whiteSize
  --love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2,   love.graphics.getHeight())
  --love.graphics.line(line.x, 0, line.x, line.whiteSize)
  for i = love.graphics.getHeight()/line.whiteSize,1,-1 do
    love.graphics.line(line.x, topPos-15, line.x, bottomPos-15)
    topPos = topPos + line.whiteSize*2
    bottomPos = bottomPos + line.blackSize*2
    --topPos = topPos + line.whiteSize
    --bottomPos = bottomPos + line.whiteSize
    --break
  end
end