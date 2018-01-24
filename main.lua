pipes = {}

x_snap = 75
y_snap = 70--53

function love.load()
  images = {
    love.graphics.newImage('images/groundTile_NE.png'),
    love.graphics.newImage('images/pipeStraight_NE.png'),
    love.graphics.newImage('images/pipeStraight_NW.png'),
    love.graphics.newImage('images/pipeStraight_SE.png'),
    love.graphics.newImage('images/pipeStraight_SW.png'),
    love.graphics.newImage('images/pipeOpening_NE.png'),
    love.graphics.newImage('images/pipeCorner_NE.png'),
    love.graphics.newImage('images/pipeCorner_NW.png'),
    love.graphics.newImage('images/pipeCorner_SE.png'),
    love.graphics.newImage('images/pipeCorner_SW.png'),
    love.graphics.newImage('images/metalStructureBottom_NE.png'),
    love.graphics.newImage('images/metalStructureCross_NE.png'),
    love.graphics.newImage('images/metalStructure_NE.png')
  }
  cur_ix = 1
  love.window.setFullscreen(true)
end

function love.draw()
  for i, pipe in ipairs(pipes) do
  	love.graphics.draw(pipe.img, pipe.x, pipe.y)
  end
  
  local x, y = love.mouse.getPosition()
  x = math.floor(x / x_snap) * x_snap
  y = math.floor(y / y_snap) * y_snap
  --love.graphics.print(x .. ', ' .. y, 500, 600)

  -- ghost the current one
  love.graphics.setColor(255, 255, 255, 100)
  love.graphics.draw(images[cur_ix], x, y)
  love.graphics.setColor(255, 255, 255, 255)
end

function love.mousereleased(x, y, button)
  x = math.floor(x / x_snap) * x_snap
  y = math.floor(y / y_snap) * y_snap
  table.insert(pipes, {x = x, y = y, img = images[cur_ix]})
end

function love.keypressed(key)
  if key == 'escape' then
  	love.event.quit()
  elseif key == 'space' then
  	cur_ix = cur_ix + 1
  	if cur_ix == #images + 1 then
      cur_ix = 1
  	end
  end
end

function love.conf(t)
	t.console = true
end