Commander = require('../src/commander').Commander

describe 'Commander', ->
  beforeEach ->
    @commander = new Commander()

  describe "Initial state", ->
    it "Should initialize a commander" ,->
      expect(@commander).toBeDefined()

    it "The initial commander name must be 'Jameson'", ->
      expect(@commander.name).toEqual "Jameson"

    it "The initial legal status must be 'Clean", ->
      expect(@commander.legal_status).toEqual 'Clean'

    it "The commander must start with 100.0 credits", ->
      expect(@commander.credits).toEqual 100.0

    it "New GalCop pilot licenses are issued only at 'Lave'", ->
      expect(@commander.current_system).toEqual 'Lave'

    it "A fresh pilot should have 0 kills", ->
      expect(@commander.kills).toEqual 0

    it "Commanders start out as 'Harmless'", ->
      expect(@commander.elite_rating).toEqual "Harmless"

  describe "Elite Rating", ->
    it "Should award the rating 'Mostly Harmless' after 8 kills", ->
      @commander.confirmed_kill(1) for kill in [0..7]
      expect(@commander.elite_rating).toEqual "Mostly Harmless"

    it "Should award the rating 'Poor' after 16 kills", ->
      @commander.confirmed_kill(1) for kill in [0..15]
      expect(@commander.elite_rating).toEqual "Poor"

    it "Should award the rating 'Average' after 32 kills", ->
      @commander.confirmed_kill(1) for kill in [0..31]
      expect(@commander.elite_rating).toEqual "Average"

    it "Should award the rating 'Above Average' after 64 kills", ->
      @commander.confirmed_kill(1) for kill in [0..63]
      expect(@commander.elite_rating).toEqual "Above Average"

    it "Should award the rating 'Competent' after 128 kills", ->
      @commander.confirmed_kill(1) for kill in [0..127]
      expect(@commander.elite_rating).toEqual "Competent"

    it "Should award the rating 'Dangerous' after 512 kills", ->
      @commander.confirmed_kill(1) for kill in [0..511]
      expect(@commander.elite_rating).toEqual "Dangerous"

    it "Should award the rating 'Deadly' after 2560 kills", ->
      @commander.confirmed_kill(1) for kill in [0..2559]
      expect(@commander.elite_rating).toEqual "Deadly"

    it "Should award the rating 'Elite' after 6400 kills", ->
      @commander.confirmed_kill(1) for kill in [0..6399]
      expect(@commander.elite_rating).toEqual "Elite"

