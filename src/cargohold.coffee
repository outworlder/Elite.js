Commodity = require('./commodity').Commodity

class Cargohold
  constructor: ->
    this.items = []

  addItem: (commodity) ->
    count = this.items.length
    this.items.push(commodity) if commodity.isValid() and not (this.limit? and count >= this.limit)

  removeItem: (commodity) ->
    t = this.items.indexOf(commodity)
    this.items.splice(t,1) if t > -1

    # Counts the number of identical items in the cargohold
  numberOfItems: (commodity) ->
    n = 0
    ++n for item in this.items when item.name is commodity.name
    n

  fullInventory: ->
    inv = {}
    for name, data of (new Commodity "Dummy").types
      inv[name] = { amount: this.numberOfItems(new Commodity name), unit: data.unit }
    inv

  inventory: ->
    inv = {}
    for c in this.items
      inv[c.name] = { amount: this.numberOfItems(c), unit: c.unit }
    inv

(exports ? this).Cargohold = Cargohold