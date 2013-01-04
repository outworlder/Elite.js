(function() {
  var Commander;

  Commander = require('../src/commander').Commander;

  describe('Commander', function() {
    beforeEach(function() {
      return this.commander = new Commander();
    });
    describe("Initial state", function() {
      it("Should initialize a commander", function() {
        return expect(this.commander).toBeDefined();
      });
      it("The initial commander name must be 'Jameson'", function() {
        return expect(this.commander.name).toEqual("Jameson");
      });
      it("The initial legal status must be 'Clean", function() {
        return expect(this.commander.legalStatus).toEqual('Clean');
      });
      it("The commander must start with 100.0 credits", function() {
        return expect(this.commander.credits).toEqual(100.0);
      });
      it("New GalCop pilot licenses are issued only at 'Lave'", function() {
        return expect(this.commander.currentSystem).toEqual('Lave');
      });
      it("A fresh pilot should have 0 kills", function() {
        return expect(this.commander.kills).toEqual(0);
      });
      return it("Commanders start out as 'Harmless'", function() {
        return expect(this.commander.eliteRating).toEqual("Harmless");
      });
    });
    describe("Elite Rating", function() {
      it("Should award the rating 'Mostly Harmless' after 8 kills", function() {
        var kill;
        for (kill = 0; kill <= 7; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Mostly Harmless");
      });
      it("Should award the rating 'Poor' after 16 kills", function() {
        var kill;
        for (kill = 0; kill <= 15; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Poor");
      });
      it("Should award the rating 'Average' after 32 kills", function() {
        var kill;
        for (kill = 0; kill <= 31; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Average");
      });
      it("Should award the rating 'Above Average' after 64 kills", function() {
        var kill;
        for (kill = 0; kill <= 63; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Above Average");
      });
      it("Should award the rating 'Competent' after 128 kills", function() {
        var kill;
        for (kill = 0; kill <= 127; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Competent");
      });
      it("Should award the rating 'Dangerous' after 512 kills", function() {
        var kill;
        for (kill = 0; kill <= 511; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Dangerous");
      });
      it("Should award the rating 'Deadly' after 2560 kills", function() {
        var kill;
        for (kill = 0; kill <= 2559; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Deadly");
      });
      return it("Should award the rating 'Elite' after 6400 kills", function() {
        var kill;
        for (kill = 0; kill <= 6399; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(this.commander.eliteRating).toEqual("Elite");
      });
    });
    return describe("Right on, Commander!", function() {
      it("Should not display any messages before 256 kills", function() {
        var count, kill;
        count = 0;
        this.commander.rightOnCommander = function() {
          return count = count + 1;
        };
        for (kill = 0; kill <= 254; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(count).toEqual(0);
      });
      it("Should display exactly one message on reaching 256 kills", function() {
        var count, kill;
        count = 0;
        this.commander.rightOnCommander = function() {
          return count = count + 1;
        };
        for (kill = 0; kill <= 255; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(count).toEqual(1);
      });
      return it("Takes 25 messages to reach 'Elite' status", function() {
        var count, kill;
        count = 0;
        this.commander.rightOnCommander = function() {
          return count = count + 1;
        };
        for (kill = 0; kill <= 6399; kill++) {
          this.commander.confirmedKill(1);
        }
        return expect(count).toEqual(25);
      });
    });
  });

}).call(this);
