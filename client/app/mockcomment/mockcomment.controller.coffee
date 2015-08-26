'use strict'

angular.module 'nisyvocabApp'
.controller 'MockcommentCtrl', ($scope) ->
  $scope.message = 'Hello'

  $scope.slides = [
      image: '/assets/images/mock/news1.jpg'
      text: 'จดหมายข่าวรายเดือน ฉบับที่ 12'
      # active: true
    ,
      image: '/assets/images/longbanner_map.jpg'
      text: 'กองทุนนวัตกรรม'
      # active: true
  ]

  
  $scope.chooseMenu = (item) ->
    $scope.showingSubmenu = true
    $scope.activeMenu = item