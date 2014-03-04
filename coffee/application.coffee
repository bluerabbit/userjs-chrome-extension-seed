class window.App
  hoge: ->
    console.log(new Date())
    true

$ ->
  new App().hoge()
