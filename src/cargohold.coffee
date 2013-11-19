Commodity = require('./commodity').Commodity

class Cargohold
  constructor: ->
    @items = []

  addItem: (commodity) ->
    count = @items.length
    @items.push(commodity) if commodity.isValid() and not (@limit? and count >= @limit)

  removeItem: (commodity) ->
    t = @items.indexOf(commodity)
    @items.splice(t,1) if t > -1

    # Counts the number of identical items in the cargohold
  numberOfItems: (commodity) ->
    n = 0
    ++n for item in @items when item.name is commodity.name
    n

  fullInventory: ->
    inv = {}
    for name, data of (new Commodity "Dummy").types
      inv[name] = { amount: @numberOfItems(new Commodity name), unit: data.unit }
    inv

  inventory: ->
    inv = {}
    for c in @items
      inv[c.name] = { amount: @numberOfItems(c), unit: c.unit }
    inv

(exports ? this).Cargohold = Cargohold