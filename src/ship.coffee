c = require("./commander")
Commander = c.Commander

class Ship
  constructor: ->
    this.commander = new Commander "Jameson"
    this.fuel = 7
    this.system = "Lave"
    this.destinationSystem = "Lave"
    this.condition = "Docked"
    this.equipment = []

(exports ? this).Ship = Ship