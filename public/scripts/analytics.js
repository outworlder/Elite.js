(function() {
  var analytics, _gaq;

  _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-30087250-1']);

  _gaq.push(['_trackPageview']);

  analytics = function() {
    var ga, s;
    ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    s = document.getElementsByTagName('script')[0];
    return s.parentNode.insertBefore(ga, s);
  };

  analytics();

}).call(this);