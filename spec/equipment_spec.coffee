Equipment = require('../src/equipment').Equipment

describe 'Equipment', ->
  beforeEach ->
    @equipment = new Equipment "Cargo Bay Expansion"

  it "Should be able to create an equipment", ->
    expect(@equipment).toBeDefined()

  it "Should not be able to create an unknown equipment", ->
    @equipment = new Equipment "VSF"
    expect(@equipment.isValid).toBeDefined()
    expect(@equipment.isValid()).toBeFalsy()

  it "Should be able to create known equipment", ->
    expect(@equipment).toBeDefined()
    expect(@equipment.name).toBe("Cargo Bay Expansion")
    expect(@equipment.isValid()).toBeTruthy()
    @equipment = new Equipment "Fuel Scoops"
    expect(@equipment.isValid()).toBeTruthy()

  it "Should have a cost", ->
    expect(@equipment.cost).toBeDefined()
    expect(@equipment.cost).toBe(400.0)

  it "Should have a techLevel", ->
    expect(@equipment.techLevel).toBeDefined()
    expect(@equipment.techLevel).toBe(2)