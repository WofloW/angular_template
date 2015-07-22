class HomeController
  constructor: (@$example) ->
    @name = @$example.name

  getPrefix: ->
    @$example.getPrefix()

HomeController.$inject = [
  "module.namespace.example"
]

module.exports = HomeController