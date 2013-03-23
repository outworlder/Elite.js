Ship = require('../src/ship').Ship

describe 'Ship', ->
  beforeEach ->
    @ship = new Ship

  it "Should be able to create a ship", ->
    expect(@ship).toBeDefined()

  it "Should have a commander", ->
    expect(@ship.commander).toBeDefined()

  describe "Fuel", ->
    it "Should have fuel", ->
      expect(@ship.fuel).toBeDefined()
    it "Should have 7 light-years worth of fuel at first", ->
      expect(@ship.fuel).toBe 7.0

  describe "Location", ->
    it "Should have a location", ->
        expect(@ship.system).toBeDefined()
    it "Should start out at Lave", ->
        expect(@ship.system).toBe "Lave"
    it "Should have a destination system", ->
        expect(@ship.destinationSystem).toBeDefined()
    it "Should have the initial destination as Lave", ->
        expect(@ship.destinationSystem).toBe "Lave"

  describe "Conditions", ->
    it "Should have a condition", ->
      expect(@ship.condition).toBeDefined()
    it "Should be docked in the beginning", ->
      expect(@ship.condition).toBe "Docked"