class Commander
  legal_status: 'Clean'
  credits: 100.0
  current_system: 'Lave'
  kills: 0

  right_on_commander: ->
    console.log "Right on, Commander!"

  # Tried to do clever bit manipulation, but became confusing
  calc_elite_rating: ->
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
    this.elite_rating = galcop_elite_ratings[largest]

  confirmed_kill: (bounty) ->
    this.kills = this.kills + 1
    this.credits = this.credits + bounty
    this.calc_elite_rating()

  constructor: (@name = "Jameson") ->
    this.calc_elite_rating()

# As explained here: http://autotelicum.github.com/Smooth-CoffeeScript/interactive/interactive-coffeescript.html#object-oriented-programming
(exports ? this).Commander = Commander

