html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Elite.js'} | Elite in Javascript"
    link rel: 'stylesheet', href: '/stylesheets/main.css'
  body ->
    div '#main', ->
      div '#main-screen', ->
        span ->
          h1 '#screen-label', ->
            'FRONT VIEW'
      div '#viewscreen', ->

      div '#aux-screen', ->
        div '#left-pane', ->
          div '#forward-shields.gauge', ->
            span '.indicator-label', ->
              "FS"
            div '.indicator-amount.notches-lots', ->

          div '#aft-shields.gauge', ->
            span '.indicator-label', ->
              "AS"
            div '.indicator-amount.notches-lots', ->

          div '#fuel.gauge', ->
            span '.indicator-label', ->
              "FU"
            div '.indicator-amount.notches-fair', ->

          div '#cabin-temperature.gauge', ->
            span '.indicator-label', ->
              "CT"
            div '.indicator-amount.notches-fair', ->

          div '#laser-temperature.gauge', ->
            span '.indicator-label', ->
              "LT"
            div '.indicator-amount.notches-fair', ->

          div '#altitude.gauge', ->
            span '.indicator-label', ->
              "AT"
            div '.indicator-amount notches-fair', ->

          div '#missiles.gauge', ->
            span '.indicator-label.missile-icon', ->
              "AT"
            div '.indicator-amount.notches-fair', ->

        div '#center-pane', ->
          div '#space-compass', ->
            div '.inner-compass', ->

          div '#radar', ->

          div '#aegis', ->
          div '.elite-title', ->
            "ELITE"
        div '#right-pane', ->
          div '#speed.gauge', ->
            span '.indicator-label', ->
              "AT"
            div '.indicator-amount.notches-lots', ->

          div '#roll.gauge', ->
            span '.indicator-label', ->
              "RL"
            div '.indicator-amount.notches-split-middle', ->

          div '#declination.gauge', ->
            span '.indicator-label', ->
              "DC"
            div '.indicator-amount.notches-split-middle', ->

          div '#energy-bank-1.gauge', ->
            span '.indicator-label', ->
              "DC"
            div '.indicator-amount', ->

          div '#energy-bank-2.gauge', ->
            span '.indicator-label', ->
              "DC"
            div '.indicator-amount', ->

          div '#energy-bank-3.gauge', ->
            span '.indicator-label', ->
              "DC"
            div '.indicator-amount', ->

          div '#energy-bank-4.gauge', ->
            span '.indicator-label', ->
              "DC"
            div '.indicator-amount', ->


    script src: 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'
    script src: '/scripts/vendor/Three.js'
    script src: "/scripts/vendor/jasmid/stream.js"
    script src: "/scripts/vendor/jasmid/midifile.js"
    script src: "/scripts/vendor/jasmid/replayer.js"
    script src: "/scripts/vendor/jasmid/synth.js"
    script src: "/scripts/vendor/jasmid/audio.js"
    script src: '/scripts/vendor/audio.js'
    script src: '/scripts/main.js'
