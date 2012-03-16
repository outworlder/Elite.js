_gaq = _gaq || [];
_gaq.push ['_setAccount', 'UA-30087250-1']
_gaq.push ['_trackPageview']

analytics = ->
  ga = document.createElement('script')
  ga.type = 'text/javascript'
  ga.async = true;
  ga.src = (if 'https:' == document.location.protocol then 'https://ssl' else 'http://www') + '.google-analytics.com/ga.js'
  s = document.getElementsByTagName('script')[0]
  s.parentNode.insertBefore(ga, s)

analytics()
