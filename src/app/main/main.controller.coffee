do (ng = angular, app = @sstApp) ->

  lightboxImages = (image) ->
    (image.additionalImages || []).map (x) ->
      'url': "assets/images/full/#{x}"
      'caption': image.description || image.name

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
          target = $ @hash
          target = if target.length then target else $("[name='#{@hash.slice 1}']")
          if target.length
            $('html,body').animate
              scrollTop: target.offset().top
            , 1000
            return false

  MainController = (Database, Lightbox) ->
    vm = @
    vm.moreImages = (image) ->
      images = lightboxImages image
      Lightbox.openModal(images, 0) if images.length

    Database.load().then (data) ->
      angular.extend vm, data

    applyMenuInteraction()
    vm

  app.controller 'MainController', ['Database', 'Lightbox', MainController]
