class Sprite
  constructor: (@image, @width, @height, @tiles) ->
    @position = [0, 0]
    @innerPos = [0, 0]
  draw: (camera) ->
    ctx.drawImage @image, @innerPos[0] * @width, @innerPos[1] * @height, \
                          @width, @height, \
                          @position[0] - camera.x, @position[1] - camera.y, \
                          @width, @height
  moveNorth: -> @moveTo @position[0], @position[1] - 4
  moveSouth: -> @moveTo @position[0], @position[1] + 4
  moveWest: -> @moveTo @position[0] - 4, @position[1]
  moveEast: -> @moveTo @position[0] + 4, @position[1]
  moveTo: (x, y) -> [@position[0], @position[1]] = [x, y] if @isFieldPossible x, y
  isFieldPossible: (x, y) ->
    @tiles.getTileAtPixelPosition(x, y).walkable \
          and @tiles.getTileAtPixelPosition(x + @width - 1, y).walkable \
          and @tiles.getTileAtPixelPosition(x, y + @height - 1).walkable \
          and @tiles.getTileAtPixelPosition(x + @width, y + @height - 1).walkable



class SpriteLayer extends LevelLayer
   constructor: ->
     @sprites = new Array()
   addSprite: (sprite) ->
     @sprites.push sprite
   draw: (camera) ->
     for sprite in @sprites
        sprite.draw camera
