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
      expect(@commander.legalStatus).toEqual 'Clean'

    it "The commander must start with 100.0 credits", ->
      expect(@commander.credits).toEqual 100.0

    it "New GalCop pilot licenses are issued only at 'Lave'", ->
      expect(@commander.currentSystem).toEqual 'Lave'

    it "A fresh pilot should have 0 kills", ->
      expect(@commander.kills).toEqual 0

    it "Commanders start out as 'Harmless'", ->
      expect(@commander.eliteRating).toEqual "Harmless"

  describe "Elite Rating", ->
    it "Should award the rating 'Mostly Harmless' after 8 kills", ->
      @commander.confirmedKill(1) for kill in [0..7]
      expect(@commander.eliteRating).toEqual "Mostly Harmless"

    it "Should award the rating 'Poor' after 16 kills", ->
      @commander.confirmedKill(1) for kill in [0..15]
      expect(@commander.eliteRating).toEqual "Poor"

    it "Should award the rating 'Average' after 32 kills", ->
      @commander.confirmedKill(1) for kill in [0..31]
      expect(@commander.eliteRating).toEqual "Average"

    it "Should award the rating 'Above Average' after 64 kills", ->
      @commander.confirmedKill(1) for kill in [0..63]
      expect(@commander.eliteRating).toEqual "Above Average"

    it "Should award the rating 'Competent' after 128 kills", ->
      @commander.confirmedKill(1) for kill in [0..127]
      expect(@commander.eliteRating).toEqual "Competent"

    it "Should award the rating 'Dangerous' after 512 kills", ->
      @commander.confirmedKill(1) for kill in [0..511]
      expect(@commander.eliteRating).toEqual "Dangerous"

    it "Should award the rating 'Deadly' after 2560 kills", ->
      @commander.confirmedKill(1) for kill in [0..2559]
      expect(@commander.eliteRating).toEqual "Deadly"

    it "Should award the rating 'Elite' after 6400 kills", ->
      @commander.confirmedKill(1) for kill in [0..6399]
      expect(@commander.eliteRating).toEqual "Elite"

  describe "Right on, Commander!", ->
    it "Should not display any messages before 256 kills", ->
      count = 0
      @commander.rightOnCommander= ->
        count = count + 1
      @commander.confirmedKill(1) for kill in [0..254]
      expect(count).toEqual 0

    it "Should display exactly one message on reaching 256 kills", ->
      count = 0
      @commander.rightOnCommander= ->
        count = count + 1
      @commander.confirmedKill(1) for kill in [0..255]
      expect(count).toEqual 1

    it "Takes 25 messages to reach 'Elite' status", ->
      count = 0
      @commander.rightOnCommander= ->
        count = count + 1
      @commander.confirmedKill(1) for kill in [0..6399]
      expect(count).toEqual 25

  describe "Money!", ->
    it "Can spend some money", ->
      @commander.spendCredits(10)
      expect(@commander.credits).toEqual 90

    it "Can never spend an amount which is less than zero", ->
      expect(=> @commander.spendCredits(-1)).toThrow(new Error "Invalid monetary amount")

    it "Is able to check if the commander can afford the transaction", ->
      expect(@commander.canSpend 110).toBeFalsy()
      expect(@commander.canSpend 100).toBeTruthy()
      expect(@commander.canSpend 10).toBeTruthy()

    it "Can never be in debt", ->
      @commander.spendCredits(50)
      expect(@commander.credits).toEqual 50
      @commander.spendCredits(40)
      expect(@commander.credits).toEqual 10
      @commander.spendCredits(15)
      expect(@commander.credits).toEqual 10

    it "Can earn money", ->
      @commander.earnCredits(1000)
      expect(@commander.credits).toEqual 1100

    it "Can never earn an amount which is less than zero", ->
      expect(=> @commander.earnCredits(-1)).toThrow(new Error "Invalid monetary amount")
