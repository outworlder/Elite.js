main = require ('../src/main')

describe 'Ship definitions', ->
  it "Will define a ship", ->
    expect(main.define_ships()).toBeDefined()
