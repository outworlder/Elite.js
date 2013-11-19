System = require('../src/system').System

describe 'System', ->
  beforeEach ->
    @system = new System

  it "Has coordinates", ->
    expect(@system.x).toBeDefined()