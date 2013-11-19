GALAXY_SIZE = 256

class System
  x: 0
  y: 0
  economy: 0
  techLevel: 0
  population: 0
  productivity: 0
  radius: 0
  name: ""

  generateGalaxy: (seed) ->
    false

(exports ? this).System = System
