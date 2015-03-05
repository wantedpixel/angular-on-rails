angular_on_rails = angular.module('angular_on_rails',[
  'templates',
  'ngRoute',
  'controllers',
])

angular_on_rails.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'InvoicesController'
    )
])


invoices = [
  {
    id: 1
    service: 'It consulting'
  },
  {
    id: 2
    service: 'Server maintenance',
  },
  {
    id: 3
    service: 'Mobile app implementation',
  },
  {
    id: 4
    service: 'Consulting on software development processes',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("InvoicesController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.keywords = keywords
      $scope.invoices = invoices.filter (invoice)-> invoice.service.toLowerCase().indexOf(keywords) != -1
    else
      $scope.invoices = invoices
])