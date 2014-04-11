pn = angular.module 'push.notice', []

pn.service "Notifier",
[ '$rootScope', ($rootScope) ->
  this.notice = (message) ->
    $rootScope.$broadcast "push:notice", message
  this.warn = (message) ->
    $rootScope.$broadcast "push:warning", message

  return this
]


template = "\
<div class=\"push {{message.style}}\">
  <div class=\"message\">{{message.message}}</div>
  <i ng-click=\"hide()\" class=\"ui basic circular icon link close\"></i>
</div>"

pn.directive "push", ->
  restrict: 'E'
  replace: true
  scope:
    message: '='
  template: template
  require: '^notifications'
  link: (scope, el, attrs, ctrl) ->
    scope.hide = ->
      ctrl.hide(scope.message.id)


pn.directive "notifications", ->
  restrict: 'E'
  replace: true
  scope: {}
  template: "<div class=\"notifications\"><push ng-repeat=\"push in notes\" message=\"push\"></push></div>"
  controller: 'pushCtrl'
  link: (scope, el, attrs) ->
    scope.$on "push:notice", (event, msg) ->
      scope.push 'notice', msg
    scope.$on "push:warning", (event, msg) ->
      scope.push 'warning', msg


pn.controller 'pushCtrl',
['$scope', '$element', '$timeout',
  ($scope, $element, $timeout) ->
    $scope.notes = []
    $scope.timers = []

    $scope.push = (style, message) ->
      id = _.random(1000)
      $scope.notes.push {
        id: id
        style: style,
        message: message
      }
      $scope.timer(id)

    $scope.timer = (id) ->
      $scope.timers[id] = $timeout ->
        _.remove $scope.notes, {id: id}
      , 10000

    this.hide = (id) ->
      $timeout.cancel($scope.timers[id])
      _.remove $scope.notes, {id: id}

    return
]