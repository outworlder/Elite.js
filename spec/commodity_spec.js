(function() {
  var Cargohold, Commodity, c;

  c = require('../src/commodity');

  Commodity = c.Commodity;

  Cargohold = c.Cargohold;

  describe('Commodity', function() {
    beforeEach(function() {
      return this.commodity = new Commodity("Food");
    });
    it("Should be able to create a commodity", function() {
      return expect(this.commodity).toBeDefined();
    });
    it("Should not be able to create an unknown commodity", function() {
      this.commodity = new Commodity("OMG");
      return expect(this.commodity.isValid).toBeTruthy();
    });
    it("Should regard 'Narcotics', 'Firearms' and 'Slaves' as illegal", function() {
      var firearms, narcotics, slaves;
      narcotics = new Commodity("Narcotics");
      firearms = new Commodity("Firearms");
      slaves = new Commodity("Slaves");
      expect(narcotics.legal).toBeFalsy();
      expect(firearms.legal).toBeFalsy();
      return expect(slaves.legal).toBeFalsy();
    });
    return it("Should regard everything else as legal", function() {
      return expect(this.commodity.legal).toBeTruthy();
    });
  });

  describe('Cargohold', function() {
    beforeEach(function() {
      this.cargohold = new Cargohold();
      this.full_cargohold = new Cargohold();
      this.full_cargohold.addItem(new Commodity("Food"));
      this.full_cargohold.addItem(new Commodity("Food"));
      this.full_cargohold.addItem(new Commodity("Alien Items"));
      return this.full_cargohold.addItem(new Commodity("Gem Stones"));
    });
    it("Should be able to add stuff to a cargohold", function() {
      expect(this.cargohold.items.length).toEqual(0);
      this.cargohold.addItem(new Commodity("Food"));
      return expect(this.cargohold.items.length).toEqual(1);
    });
    it("Should be able to remove stuff from a cargohold", function() {
      var ded;
      ded = new Commodity("Alien Items");
      this.cargohold.addItem(new Commodity("Food"));
      this.cargohold.addItem(new Commodity("Food"));
      this.cargohold.addItem(ded);
      this.cargohold.addItem(new Commodity("Textiles"));
      expect(this.cargohold.items.length).toEqual(4);
      this.cargohold.removeItem(ded);
      expect(this.cargohold.items.length).toEqual(3);
      return expect(this.cargohold.items[2].name).toEqual("Textiles");
    });
    it("Should be able to count identically named items", function() {
      var f, t;
      f = new Commodity("Food");
      t = new Commodity("Textiles");
      this.cargohold.addItem(f);
      this.cargohold.addItem(f);
      this.cargohold.addItem(t);
      expect(this.cargohold.numberOfItems(f)).toBe(2);
      expect(this.cargohold.numberOfItems(t)).toBe(1);
      return expect(this.cargohold.numberOfItems(new Commodity("Narcotics"))).toBe(0);
    });
    it("Should be able to return a full inventory", function() {
      var inv;
      expect(this.full_cargohold.items.length).toBe(4);
      inv = this.full_cargohold.fullInventory();
      return expect(inv["Food"]["amount"]).toBe(2);
    });
    it("Should be able to return the inventory, minus items with amount 0", function() {
      var inv;
      inv = this.full_cargohold.inventory();
      expect(inv["Furs"]).toBeUndefined();
      return expect(inv["Food"]["amount"]).toBe(2);
    });
    it("If a limit is set, the container must respect it", function() {
      this.cargohold.limit = 2;
      this.cargohold.addItem(new Commodity("Furs"));
      this.cargohold.addItem(new Commodity("Slaves"));
      this.cargohold.addItem(new Commodity("Machinery"));
      return expect(this.cargohold.items.length).toBe(2);
    });
    return it("Should be possible to detect if an item was added or not", function() {
      this.cargohold.limit = 1;
      expect(this.cargohold.addItem(new Commodity("Liquor/Wines"))).toBeTruthy();
      expect(this.cargohold.addItem(new Commodity("Minerals"))).toBeFalsy();
      return expect(this.cargohold.addItem(new Commodity("Minerals"))).toBeFalsy();
    });
  });

}).call(this);
