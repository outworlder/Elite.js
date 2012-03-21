class Commander
  legal_status: 'Clean'
  credits: 100.0
  current_system: 'Lave'
  kills: 0

  constructor: (@name = "Jameson") ->
    this.calc_elite_rating()

  calc_elite_rating: ->
    console.log "TODO!"

  confirmed_kill: (bounty) ->
    kills = kills + 1
    credits = credits + bounty
    calc_elite_rating

(exports ? this).Commander = Commander