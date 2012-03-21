Commander = require('../src/commander').Commander

describe 'Commander', ->
  beforeEach ->
    @commander = new Commander()

  describe "Initial state", ->
    it "Should initialize a commander" ,->
      expect(@commander).toBeDefined()

    it "The initial commander name must be 'Jameson'", ->
      expect(@commander.name).toEqual "Jameson"

    it "The initial legal status must be 'clean", ->
      expect(@commander.legal_status).toEqual 'Clean'

    it "The commander must start with 100.0 credits", ->
      expect(@commander.credits).toEqual 100.0

    it "New GalCop pilot licenses are issued only at 'Lave'", ->
      expect(@commander.current_system).toEqual 'Lave'

    it "A fresh pilot should have 0 kills", ->
      expect(@commander.kills).toEqual 0

    it "Commanders start out as 'Harmless'", ->
      expect(@commander.elite_rating).toEqual "Harmless"