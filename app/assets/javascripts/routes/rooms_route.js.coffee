# For more information see: http://emberjs.com/guides/routing/

Betterlaundry.RoomsRoute = Ember.Route.extend({
  model: -> Betterlaundry.Room.find()
})
