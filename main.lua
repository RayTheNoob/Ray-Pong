--Made for LOVE 11.3
--Started Sep 24, 2022

--Welcom to my game! It was a lot of fun to make!
--Keep in mind the this is my second LOVE project and second time useing Lua (first time was folowing a tutorial)
--Code is quite bad, sorry! ._.

--End song: https://opengameart.org/content/snowfall
--Menu song: https://opengameart.org/content/chill-lofi-inspired


function love.load()
  verName = "Spet-Oct '22: For löve 11.3: RayPong v1"
  DFONT = love.graphics.getFont()
  require ('line')
  require ('player')
  require ('ball')
  require ('score')
  require ('menu')
  require ('endscreen')
  lineLoad()
  playerLoad()
  ballLoad()
  menuL()
  endsL()
  
  updateGame = true
  drawGame = true
  updateMenu = true
  drawMenu = true
  scoreL()
  src3 = love.audio.newSource("Bells11.ogg", "static")
  --src3:play()
  
  quitSound = love.audio.newSource("intro.ogg", "static")
  
  LoseSound = love.audio.newSource("lose.ogg", "static")
  quitSound:play()
  
  endMusic = love.audio.newSource("Song.ogg", "static")
  menuMusic = love.audio.newSource("Menu.ogg", "static")
  --LoseSound:play()
  --AI mode
  --0, no AI, keyboard controlls
  --1, useless
  --2, normal
  --3, unfair
  aiMode = 4
  
  love.window.setTitle("RayPong")
  --iconIMG = love.graphics.newImage( "icon.png")
  love.window.setIcon(love.image.newImageData("icon.png"))
  
  --love.window.setMode(1000, 800, {resizable=true})
  canEsc = true
  isEscing = false
  
  menuCanScroll = true
  
  menuAI = 4
  menuScore = 6
  
  love.mouse.setVisible(false)
  
  print("Welcom to RayPong! I hope you enjoy this little game!")
  print(verName)
end

function love.update(dt)
  if (updateGame) then
    playerUpdate(dt)
    ballUpdate(dt)
    scoreU(dt)
  end
  if (updateMenu) then
    menuU(dt)
    --menuMusic:play()
    --local randVar = math.random(5,15)/3^2
    --endsU()
  end
  if (drawMenu) then
    menuMusic:play()
  end
  
  if love.keyboard.isDown("escape") and canEsc then
    canEsc = false
    if not drawMenu then
      backToMenu()
      endMusic:stop()
    else
      isEscing = true
    end
  end
  if not love.keyboard.isDown("escape") then
    canEsc = true
  end
end

function love.draw()
  if (drawGame) then
    love.graphics.setColor(0.7, 0.7, 0.7)
    lineDraw()
    love.graphics.setColor(1, 1, 1)
    --lineDraw()
    scoreD()
    love.graphics.setBackgroundColor(0.03, 0.03, 0.03)
    love.graphics.setLineWidth(3)
    playerDraw()
    ballDraw()
    love.graphics.setColor(0.7, 0.7, 0.7)
  end
  if (drawMenu) then
    love.graphics.setColor(1, 1, 1)
    menuD()
  end
  endsD()
end
