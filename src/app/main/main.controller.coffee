do (ng = angular) ->

  googleMapUrl = ['$window', ($window) ->
    (address) ->
      "https://maps.google.com/maps?f=q&q=#{$window.encodeURIComponent(address)}&z=14&output=embed"
  ]

  applyMenuInteraction = () ->
    $('#menu-close').click (e) ->
      e.preventDefault()
      $('#sidebar-wrapper').toggleClass 'active'

    # Opens the sidebar menu
    $('#menu-toggle').click (e) ->
      e.preventDefault()
      $('#sidebar-wrapper').toggleClass 'active'

    # Scrolls to the selected menu item on the page
    $ () ->
      $('a[href*=#]:not([href=#])').click () ->
        if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') || location.hostname == @hostname
          target = $(@hash)
          target = if target.length then target else $("[name='#{@hash.slice 1}']")
          if target.length
            $('html,body').animate
              scrollTop: target.offset().top
            , 1000
            return false

  MainController = ['Database', (Database) ->
    vm = @

    Database.load().then (data) -> angular.extend(vm, data)

    vm.services = [
      {
        name: 'Service 1',
        icon: 'cloud',
        description: 'Service 1 does a lot of stuff'
      },
      {
        name: 'Service 2',
        icon: 'compass',
        description: 'Service 2 does a lot of stuff'
      },
      {
        name: 'Service 3',
        icon: 'shield',
        description: 'Service 3 does a lot of stuff'
      },
    ]

    applyMenuInteraction()

    vm
  ]

  trust = ['$sce', ($sce) ->
    $sce.trustAsResourceUrl
  ]

  ng.module 'simpleShopTemplate'
    .controller 'MainController', MainController
    .filter 'googleMapUrl', googleMapUrl
    .filter 'trust', trust
