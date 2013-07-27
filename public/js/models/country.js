App.Country = DS.Model.extend({
  name: DS.attr('string'),
  alpha3: DS.attr('string'),
  golfers: DS.hasMany('App.Golfer')
});
