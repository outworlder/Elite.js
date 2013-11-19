class Equipment
  types:
    "Cargo Bay Expansion":
      cost: 400.0
      techLevel: 2
    "Fuel Scoops":
      cost: 525.0
      techLevel: 6
    "Advanced Navigational Array":
      cost: 2250.0
      techLevel: 7
    "Advanced Space Compass":
      cost: 650.0
      techLevel: 7
    "Docking Computers":
      cost: 1500.0
      techLevel: 10
    "E.C.M. System":
      cost: 600.0
      techLevel: 3
    "Escape Pod":
      cost: 1000.0
      techLevel: 7
    "Extra Energy Unit":
      cost: 1500.0
      techLevel: 9
    "External Heat Shielding":
      cost: 1500.0
      techLevel: 5
    "Galactic Hyperdrive":
      cost: 5000.0
      techLevel: 11
    "IFF System":
      cost: 0
      techLevel: 0
    "Military Shield Enhancement":
      cost: 47550.0
      techLevel: 14
    "Multi-Targeting System":
      cost: 325.0
      techLevel: 6
    "Naval Energy Unit":
      cost: 300000.0
      techLevel: 1000
    "Passenger Berth":
      cost: 825.0
      techLevel: 6
      cargo: 5
    "Scanner Targeting Enhancement":
      cost: 450.0
      techLevel: 12
    "Shield Boosters":
      cost: 14750.0
      techLevel: 11
    "Target System Memory Expansion":
      cost: 1250.0
      techLevel: 9
    "Witchdrive Fuel Injectors":
      cost: 600.0
      techLevel: 11
    "Wormhole Scanner":
      cost: 2395.0
      techLevel: 10

  constructor: (@name) ->
    return if not @types[@name]?

    @cost = @types[@name].cost
    @techLevel = @types[@name].techLevel

  isValid: ->
    return @types[@name]?

(exports ? this).Equipment = Equipment