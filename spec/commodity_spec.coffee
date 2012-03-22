Commodity = require('../src/commodity').Commodity

describe 'Commodity', ->
  beforeEach ->
    @commodity = new Commodity "Food"

  it "Should be able to create a commodity", ->
    expect(@commodity).toBeDefined()

  it "Should not be able to create an unknown commodity", ->
    @commodity = new Commodity "OMG"
    expect(@commodity.isValid).toBeTruthy()