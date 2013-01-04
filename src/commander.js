(function() {
  var Commander;

  Commander = (function() {

    Commander.prototype.legalStatus = 'Clean';

    Commander.prototype.credits = 100.0;

    Commander.prototype.currentSystem = 'Lave';

    Commander.prototype.kills = 0;

    Commander.prototype.rightOnCommander = function() {
      return console.log("Right on, Commander!");
    };

    Commander.prototype.calcEliteRating = function() {
      var galcop_elite_ratings, i, largest, rating;
      galcop_elite_ratings = {
        0: "Harmless",
        8: "Mostly Harmless",
        16: "Poor",
        32: "Average",
        64: "Above Average",
        128: "Competent",
        512: "Dangerous",
        2560: "Deadly",
        6400: "Elite"
      };
      largest = 0;
      for (i in galcop_elite_ratings) {
        rating = galcop_elite_ratings[i];
        if (this.kills >= i) largest = i;
      }
      if (this.kills % 256 === 0 && this.kills > 0) this.rightOnCommander();
      return this.eliteRating = galcop_elite_ratings[largest];
    };

    Commander.prototype.confirmedKill = function(bounty) {
      this.kills = this.kills + 1;
      this.credits = this.credits + bounty;
      return this.calcEliteRating();
    };

    function Commander(name) {
      this.name = name != null ? name : "Jameson";
      this.calcEliteRating();
    }

    return Commander;

  })();

  (typeof exports !== "undefined" && exports !== null ? exports : this).Commander = Commander;

}).call(this);
