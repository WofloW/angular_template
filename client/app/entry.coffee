
angular = require "angularjs"
app = angular.module('applicationName', [ 'ui.router' ])

require('./core/entry.coffee') app
require('./home/entry.coffee') app