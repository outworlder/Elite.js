class Commodity
  types:
    "Food":
      unit: "TC"
    "Textiles":
      unit: "TC"
    "Furs":
      unit: "TC"
    "Liquor/Wines":
      unit: "TC"
    "Luxuries":
      unit: "TC"
    "Machinery":
      unit: "TC"
    "Radioactives":
      unit: "TC"
    "Slaves":
      unit: "TC"
      illegal: true
    "Computers":
      unit: "TC"
    "Alloys":
      unit: "TC"
    "Firearms":
      unit: "TC",
      illegal: true
    "Narcotics":
      unit: "TC",
      illegal: true
    "Minerals":
      unit: "kg"
    "Gold":
      unit: "kg"
    "Platinum":
      unit: "kg"
    "Gem Stones":
      unit: "g"
    "Alien Items":
      unit: "TC"

  constructor: (@name) ->
    return if not this.types[@name]?

    this.unit = this.types[@name].unit

  isValid: ->
    return this.unit?

(exports ? this).Commodity = Commodity
