(function() {
  var app, coffee, express, jade, port;

  express = require('express');

  jade = require('jade');

  coffee = require('coffee-script');

  app = express.createServer(express.logger());

  app.configure(function() {
    app.set('view engine', 'coffee');
    app.register('.coffee', require('coffeekup').adapters.express);
    app.use(express.bodyParser());
    app.use(express.static(__dirname + '/public'));
    app.use(express.methodOverride());
    return app.use(app.router);
  });

  app.configure('development', function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });

  app.get('/', function(request, response) {
    return response.render('index', {
      layout: false
    });
  });

  port = process.env.PORT || 3000;

  app.listen(port, function() {
    return console.log("Listening on " + port);
  });

}).call(this);
