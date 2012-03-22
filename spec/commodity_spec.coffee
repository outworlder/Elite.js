c = require('../src/commodity')

Commodity = c.Commodity
Container = c.Container

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
