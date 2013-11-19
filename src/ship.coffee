c = require("./commander")
Commander = c.Commander

class Ship
  constructor: ->
    @commander = new Commander "Jameson"
    @fuel = 7
    @system = "Lave"
    @destinationSystem = "Lave"
    @condition = "Docked"
    @equipment = []

(exports ? this).Ship = Ship