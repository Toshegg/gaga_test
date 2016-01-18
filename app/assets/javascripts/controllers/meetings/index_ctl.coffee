controller = ($scope, $state, $log, Meeting, Game, Filter) ->
  $scope.filters = {"games_ids[]": []}
  $scope.new_filter = {}
  $scope.selected_game = {}
  $scope.weekdays = [
    {number: 1, name: "Пн"},
    {number: 2, name: "Вт"},
    {number: 3, name: "Ср"},
    {number: 4, name: "Чт"},
    {number: 5, name: "Пт"},
    {number: 6, name: "Сб"},
    {number: 0, name: "Вс"}
  ]

  $scope.meetings = Meeting.index($scope.filters)
  $scope.games = Game.index()
  $scope.filters_list = Filter.index()

  $scope.show_filters = false

  $scope.new_meeting = () ->
    $state.go 'main.meetings.new'

  $scope.switch_show_filters = () ->
    $scope.show_filters = !$scope.show_filters

  $scope.$watch 'selected_game', (newV, oldV) ->
    if $scope.selected_game.id
      $scope.filters["games_ids[]"].add($scope.selected_game.id)
  , true

  $scope.$watch 'filters', (newV, oldV) ->
    if angular.isString($scope.filters)
      $scope.filters = angular.fromJson($scope.filters)
    $scope.meetings = Meeting.index($scope.filters)
  , true

  $scope.games_to_string = (meeting) ->
    meeting.games.map('name').join(', ')

  $scope.save_filter = () ->
    value = angular.toJson($scope.filters)
    
    Filter.create({value: value, name: $scope.new_filter.name})


angular.module('gaga_test').controller('MeetingsIndexCtl', controller)
