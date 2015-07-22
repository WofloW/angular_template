module.exports = (app) ->
  app.service {
    "module.namespace.example": require("./services/example.service.coffee")
  }

  app.config require './route.config.coffee'