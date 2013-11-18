Cargohold = require('../src/cargohold').Cargohold
Commodity = require('../src/commodity').Commodity

# We have to mock this.

describe 'Cargohold', ->
  beforeEach ->
    @cargohold = new Cargohold()
    @full_cargohold = new Cargohold()
    @full_cargohold.addItem new Commodity "Food"
    @full_cargohold.addItem new Commodity "Food"
    @full_cargohold.addItem new Commodity "Alien Items"
    @full_cargohold.addItem new Commodity "Gem Stones"

  it "Should be able to add stuff to a cargohold", ->
    expect(@cargohold.items.length).toEqual 0
    @cargohold.addItem new Commodity "Food"
    expect(@cargohold.items.length).toEqual 1

  it "Should be able to remove stuff from a cargohold", ->
    ded = new Commodity "Alien Items"
    @cargohold.addItem new Commodity "Food"
    @cargohold.addItem new Commodity "Food"
    @cargohold.addItem ded
    @cargohold.addItem new Commodity "Textiles"

    expect(@cargohold.items.length).toEqual 4
    @cargohold.removeItem ded
    expect(@cargohold.items.length).toEqual 3
    expect(@cargohold.items[2].name).toEqual "Textiles"

  it "Should be able to count identically named items", ->
    f = new Commodity "Food"
    t = new Commodity "Textiles"
    @cargohold.addItem f
    @cargohold.addItem f
    @cargohold.addItem t
    expect(@cargohold.numberOfItems f).toBe 2
    expect(@cargohold.numberOfItems t).toBe 1
    expect(@cargohold.numberOfItems(new Commodity "Narcotics")).toBe 0

  it "Should be able to return a full inventory", ->
    expect(@full_cargohold.items.length).toBe 4
    inv = @full_cargohold.fullInventory()
    expect(inv["Food"]["amount"]).toBe 2

  it "Should be able to return the inventory, minus items with amount 0", ->
    inv = @full_cargohold.inventory()
    expect(inv["Furs"]).toBeUndefined()
    expect(inv["Food"]["amount"]).toBe 2

  it "If a limit is set, the container must respect it", ->
    @cargohold.limit = 2
    @cargohold.addItem new Commodity "Furs"
    @cargohold.addItem new Commodity "Slaves"
    @cargohold.addItem new Commodity "Machinery"
    expect(@cargohold.items.length).toBe 2

  it "Should be possible to detect if an item was added or not", ->
    @cargohold.limit = 1
    expect(@cargohold.addItem new Commodity "Liquor/Wines").toBeTruthy()
    expect(@cargohold.addItem new Commodity "Minerals").toBeFalsy()
    expect(@cargohold.addItem new Commodity "Minerals").toBeFalsy()
