# For more information see: http://emberjs.com/guides/routing/
Betterlaundry.Router.reopen
  location: 'history'
  rootURL: '/'

Betterlaundry.Router.map ()->
  @resource 'rooms', ->
    @route 'show', path: '/:room_id'
    @resource 'machines'
