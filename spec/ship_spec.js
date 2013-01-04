(function() {
  var Ship, s;

  s = require('../src/ship');

  Ship = s.Ship;

  describe('Ship', function() {
    beforeEach(function() {
      return this.ship = new Ship;
    });
    it("Should be able to create a ship", function() {
      return expect(this.ship).toBeDefined();
    });
    it("Should have a commander", function() {
      return expect(this.ship.commander).toBeDefined();
    });
    describe("Fuel", function() {
      it("Should have fuel", function() {
        return expect(this.ship.fuel).toBeDefined();
      });
      return it("Should have 7 light-years worth of fuel at first", function() {
        return expect(this.ship.fuel).toBe(7.0);
      });
    });
    describe("Location", function() {
      it("Should have a location", function() {
        return expect(this.ship.system).toBeDefined();
      });
      it("Should start out at Lave", function() {
        return expect(this.ship.system).toBe("Lave");
      });
      it("Should have a destination system", function() {
        return expect(this.ship.destinationSystem).toBeDefined();
      });
      return it("Should have the initial destination as Lave", function() {
        return expect(this.ship.destinationSystem).toBe("Lave");
      });
    });
    return describe("Conditions", function() {
      it("Should have a condition", function() {
        return expect(this.ship.condition).toBeDefined();
      });
      return it("Should be docked in the beginning", function() {
        return expect(this.ship.condition).toBe("Docked");
      });
    });
  });

}).call(this);
