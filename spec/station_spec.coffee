Station = require("../src/station").Station

describe 'Station', ->
  beforeEach ->
    @station = new Station "Lave"

  it "Has a system", ->
    expect(@station.system).toBeDefined()
