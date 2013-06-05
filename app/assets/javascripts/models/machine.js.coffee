# for more details see: http://emberjs.com/guides/models/defining-models/

Betterlaundry.Machine = DS.Model.extend
  room: DS.belongsTo 'Betterlaundry.Room'
  number: DS.attr 'number'
  remaining: DS.attr 'number'
  status: DS.attr 'string'
