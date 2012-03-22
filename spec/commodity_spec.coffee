c = require('../src/commodity')

Commodity = c.Commodity
Cargohold = c.Cargohold

describe 'Commodity', ->
  beforeEach ->
    @commodity = new Commodity "Food"

  it "Should be able to create a commodity", ->
    expect(@commodity).toBeDefined()

  it "Should not be able to create an unknown commodity", ->
    @commodity = new Commodity "OMG"
    expect(@commodity.isValid).toBeTruthy()

  it "Should regard 'Narcotics', 'Firearms' and 'Slaves' as illegal", ->
    narcotics = new Commodity "Narcotics"
    firearms = new Commodity "Firearms"
    slaves = new Commodity "Slaves"
    expect(narcotics.legal).toBeFalsy()
    expect(firearms.legal).toBeFalsy()
    expect(slaves.legal).toBeFalsy()

  it "Should regard everything else as legal", ->
    expect(@commodity.legal).toBeTruthy()

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