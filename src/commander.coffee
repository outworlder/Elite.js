class Commander
  legalStatus: 'Clean'
  credits: 100.0
  currentSystem: 'Lave'
  kills: 0

  rightOnCommander: ->
    console.log "Right on, Commander!"

  # Tried to do clever bit manipulation, but became confusing
  calcEliteRating: ->
    galcop_elite_ratings =
      0: "Harmless",
      8: "Mostly Harmless",
      16: "Poor",
      32: "Average",
      64: "Above Average",
      128: "Competent",
      512: "Dangerous",
      2560: "Deadly",
      6400: "Elite"

    largest = 0
    for i, rating of galcop_elite_ratings
      largest = i if this.kills >= i
    this.rightOnCommander() if this.kills % 256 is 0 and this.kills > 0
    this.eliteRating = galcop_elite_ratings[largest]

  confirmedKill: (bounty) ->
    this.kills = this.kills + 1
    this.credits = this.credits + bounty
    this.calcEliteRating()

  spendCredits: (amount) ->
    throw new Error "Invalid monetary amount" if amount < 0

    @credits -= amount if @canSpend(amount)
    @credits

  canSpend: (amount) ->
    @credits - amount >= 0

  earnCredits: (amount) ->
    throw new Error "Invalid monetary amount" if amount < 0

    @credits += amount
    @credits

  constructor: (@name = "Jameson") ->
    this.calcEliteRating()

# As explained here: http://autotelicum.github.com/Smooth-CoffeeScript/interactive/interactive-coffeescript.html#object-oriented-programming
(exports ? this).Commander = Commander
