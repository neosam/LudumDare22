canvas=0
ctx=0
level=0
player=0

movementX = 0
movementY = 0

draw = ->
  calculation()
  level.draw()

calculation = ->
finalPositions = []
finalPositionAction = ->


compareFinalPositions = (playerPos, finalPos) ->
        Math.floor(playerPos[0] / player.width) == finalPos[0] and \
        Math.floor(playerPos[1] / player.height) == finalPos[1]

defaultLevelCalculation = ->
  player.moveNorth() if movementY < 0
  player.moveSouth() if movementY > 0
  player.moveWest() if movementX < 0
  player.moveEast() if movementX > 0
  level.camera.x = player.position[0] - (canvas.width - player.width) / 2
  level.camera.y = player.position[1] - (canvas.height - player.height) / 2
  for finalPosition in finalPositions
    if compareFinalPositions player.position, finalPosition
      finalPositionAction()
      return

resetPlayerAnimation = ->
  if movementY < 0
    player.setAnimation 'goNorth'
  else if movementY > 0
    player.setAnimation 'goSouth'
  else if movementX < 0
    player.setAnimation 'goWest'
  else if movementX > 0
    player.setAnimation 'goEast'
  else
    player.setAnimation 'default'

prepareLevel4 = ->
  console.log 'prepare level 4'
  backgroundImage = new Image()
  backgroundImage.src = 'media/mysticalBG.png'
  backgroundImage2 = new Image()
  backgroundImage2.src = 'media/mysticalBG2.png'
  fgImage = new Image()
  fgImage.src = 'media/foreground.png'
  tilesImg = new Image()
  tilesImg.src = 'media/tiles.png'
  levelImg = new Image()
  setAction 'startGoNorth', -> movementY = -1; resetPlayerAnimation()
  setAction 'startGoSouth', -> movementY = 1; resetPlayerAnimation();
  setAction 'startGoWest', -> movementX = -1; resetPlayerAnimation();
  setAction 'startGoEast', -> movementX = 1; resetPlayerAnimation()
  setAction 'stopGoNorth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoSouth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoWest', -> movementX = 0; resetPlayerAnimation()
  setAction 'stopGoEast', -> movementX = 0; resetPlayerAnimation()
  levelImg.onload = ->
    loader = loadTileFromImage levelImg
    tiles = loader.tiles
    bgLayer = new BackgroundImageLayer backgroundImage, 0.3, 33
    bgLayer.addImage backgroundImage2
    fgLayer = new BackgroundImageLayer fgImage, 5
    layer = new TileLayer 32, 32, tilesImg, tiles
    spriteLayer = new SpriteLayer()
    player.setAnimation 'dance'
    player.position = [64, 64]
    spriteLayer.addSprite player
    level = new Level 32, 32
    level.addLayer bgLayer
    level.addLayer layer
    level.addLayer spriteLayer
    level.addLayer fgLayer
    #level.addLayer fgLayer
    $(window).keydown (event) ->
      doActionForKeyDown(event.which)
    $(window).keyup (event) ->
      doActionForKeyUp(event.which)
    calculation = defaultLevelCalculation
    finalPositionAction = ->
      calculation = loadSequence testSequence, ->
        prepareLevel3()
    finalPositions = [[6, 25]]
  levelImg.src = 'media/level.png'

prepareLevel3 = ->
  console.log 'prepare level 3'
  backgroundImage = new Image()
  backgroundImage.src = 'media/level3/background.jpg'
  fgImage = new Image()
  fgImage.src = 'media/level3/static-foreground.png'
  tilesImg = new Image()
  tilesImg.src = 'media/tiles.png'
  levelImg = new Image()
  setAction 'startGoNorth', -> movementY = -1; resetPlayerAnimation()
  setAction 'startGoSouth', -> movementY = 1; resetPlayerAnimation();
  setAction 'startGoWest', -> movementX = -1; resetPlayerAnimation();
  setAction 'startGoEast', -> movementX = 1; resetPlayerAnimation()
  setAction 'stopGoNorth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoSouth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoWest', -> movementX = 0; resetPlayerAnimation()
  setAction 'stopGoEast', -> movementX = 0; resetPlayerAnimation()
  levelImg.onload = ->
    loader = loadTileFromImage levelImg
    tiles = loader.tiles
    bgLayer = new BackgroundImageLayer backgroundImage, 0.1, 33
    fgLayer = new BackgroundImageLayer fgImage, 0
    layer = new TileLayer 32, 32, tilesImg, tiles
    spriteLayer = new SpriteLayer()
    player.setAnimation 'dance'
    player.position = [64, 64]
    spriteLayer.addSprite player
    level = new Level 32, 32
    level.addLayer bgLayer
    level.addLayer layer
    level.addLayer spriteLayer
    level.addLayer fgLayer
    #level.addLayer fgLayer
    $(window).keydown (event) ->
      doActionForKeyDown(event.which)
    $(window).keyup (event) ->
      doActionForKeyUp(event.which)
    calculation = defaultLevelCalculation
    finalPositionAction = ->
      calculation = loadSequence testSequence, ->
        prepareLevel4()
    finalPositions = [[6, 25]]
  levelImg.src = 'media/level.png'

prepareLevel2 = ->
  console.log 'prepare level 2'
  backgroundImage = new Image()
  backgroundImage.src = 'media/level2/background.jpg'
  fgImage = new Image()
  fgImage.src = 'media/foreground.png'
  tilesImg = new Image()
  tilesImg.src = 'media/tiles.png'
  levelImg = new Image()
  setAction 'startGoNorth', -> movementY = -1; resetPlayerAnimation()
  setAction 'startGoSouth', -> movementY = 1; resetPlayerAnimation();
  setAction 'startGoWest', -> movementX = -1; resetPlayerAnimation();
  setAction 'startGoEast', -> movementX = 1; resetPlayerAnimation()
  setAction 'stopGoNorth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoSouth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoWest', -> movementX = 0; resetPlayerAnimation()
  setAction 'stopGoEast', -> movementX = 0; resetPlayerAnimation()
  levelImg.onload = ->
    loader = loadTileFromImage levelImg
    tiles = loader.tiles
    bgLayer = new BackgroundImageLayer backgroundImage, 0.1, 33
    fgLayer = new BackgroundImageLayer fgImage, 5
    layer = new TileLayer 32, 32, tilesImg, tiles
    spriteLayer = new SpriteLayer()
    player.setAnimation 'dance'
    player.position = [64, 64]
    spriteLayer.addSprite player
    level = new Level 32, 32
    level.addLayer bgLayer
    level.addLayer layer
    level.addLayer spriteLayer
    #level.addLayer fgLayer
    $(window).keydown (event) ->
      doActionForKeyDown(event.which)
    $(window).keyup (event) ->
      doActionForKeyUp(event.which)
    calculation = defaultLevelCalculation
    finalPositionAction = ->
      calculation = loadSequence testSequence, ->
        prepareLevel3()
    finalPositions = [[6, 25]]
  levelImg.src = 'media/level.png'

prepareLevel1 = ->
  console.log 'prepare level 1'
  backgroundImage = new Image()
  backgroundImage.src = 'media/level1/background1.jpg'
  backgroundImage2 = new Image()
  backgroundImage2.src = 'media/level1/background2.jpg'
  fgImage = new Image()
  fgImage.src = 'media/foreground.png'
  tilesImg = new Image()
  tilesImg.src = 'media/tiles.png'
  levelImg = new Image()
  setAction 'startGoNorth', -> movementY = -1; resetPlayerAnimation()
  setAction 'startGoSouth', -> movementY = 1; resetPlayerAnimation();
  setAction 'startGoWest', -> movementX = -1; resetPlayerAnimation();
  setAction 'startGoEast', -> movementX = 1; resetPlayerAnimation()
  setAction 'stopGoNorth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoSouth', -> movementY = 0; resetPlayerAnimation()
  setAction 'stopGoWest', -> movementX = 0; resetPlayerAnimation()
  setAction 'stopGoEast', -> movementX = 0; resetPlayerAnimation()
  levelImg.onload = ->
    loader = loadTileFromImage levelImg
    tiles = loader.tiles
    bgLayer = new BackgroundImageLayer backgroundImage, 1, 33
    bgLayer.addImage backgroundImage2
    fgLayer = new BackgroundImageLayer fgImage, 5
    layer = new TileLayer 32, 32, tilesImg, tiles
    spriteLayer = new SpriteLayer()
    player = new Sprite tilesImg, 32, 32, tiles
    player.innerPos = [0, 10]
    player.position = [64, 64]
    playerDanceAnimation =
      speed: 11
      positions: [
        [1,10], [2, 10]
      ]
    playerNorthAnimation =
      speed: 4
      positions: [
        [3,10], [4, 10]
      ]
    playerSouthAnimation =
      speed: 4
      positions: [
        [1,10], [2, 10]
      ]
    playerWestAnimation =
      speed: 4
      positions: [
        [7,10], [8, 10]
      ]
    playerEastAnimation =
      speed: 4
      positions: [
        [5,10], [6, 10]
      ]
    player.animations['dance'] = playerDanceAnimation
    player.animations['goSouth'] = playerSouthAnimation
    player.animations['goNorth'] = playerNorthAnimation
    player.animations['goWest'] = playerWestAnimation
    player.animations['goEast'] = playerEastAnimation
    player.setAnimation 'dance'
    spriteLayer.addSprite player
    level = new Level 32, 32
    level.addLayer bgLayer
    level.addLayer layer
    level.addLayer spriteLayer
    #level.addLayer fgLayer
    $(window).keydown (event) ->
      doActionForKeyDown(event.which)
    $(window).keyup (event) ->
      doActionForKeyUp(event.which)
    calculation = defaultLevelCalculation
    finalPositionAction = ->
      calculation = loadSequence testSequence, ->
        prepareLevel2()
    finalPositions = [[6, 25]]
  levelImg.src = 'media/level.png'

$(document).ready ->
  canvas = document.getElementById 'gamefield'
  if (!canvas.getContext)
    alert 'Could not initialize canvas.  Please download a real browser'
    return


  ctx = canvas.getContext '2d'
  level = new Level 0, 0
  calculation = loadSequence testSequence, ->
    prepareLevel1()
  window.setInterval 'draw()', 33






