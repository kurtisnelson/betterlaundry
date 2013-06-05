# for more details see: http://emberjs.com/guides/models/defining-models/

Betterlaundry.Room = DS.Model.extend
  name: DS.attr 'string'
  last_synced: DS.attr 'date'
