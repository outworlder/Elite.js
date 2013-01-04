(function() {
  var Equipment, e;

  e = require('../src/equipment');

  Equipment = e.Equipment;

  describe('Equipment', function() {
    beforeEach(function() {
      return this.equipment = new Equipment("Cargo Bay Expansion");
    });
    it("Should be able to create an equipment", function() {
      return expect(this.equipment).toBeDefined();
    });
    it("Should not be able to create an unknown equipment", function() {
      this.equipment = new Equipment("VSF");
      expect(this.equipment.isValid).toBeDefined();
      return expect(this.equipment.isValid()).toBeFalsy();
    });
    it("Should be able to create known equipment", function() {
      expect(this.equipment).toBeDefined();
      expect(this.equipment.name).toBe("Cargo Bay Expansion");
      expect(this.equipment.isValid()).toBeTruthy();
      this.equipment = new Equipment("Fuel Scoops");
      return expect(this.equipment.isValid()).toBeTruthy();
    });
    it("Should have a cost", function() {
      expect(this.equipment.cost).toBeDefined();
      return expect(this.equipment.cost).toBe(400.0);
    });
    return it("Should have a techLevel", function() {
      expect(this.equipment.techLevel).toBeDefined();
      return expect(this.equipment.techLevel).toBe(2);
    });
  });

}).call(this);
