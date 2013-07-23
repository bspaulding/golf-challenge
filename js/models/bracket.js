App.Bracket = ParseModel.extend({
  golfers: DS.hasMany('App.Golfer'),

  availableGolfers: function() {
    var self = this;
    return App.Golfer.filter(function(golfer) {
      return self.get('golfers').mapProperty('id').indexOf(golfer.get('id')) < 0
          && golfer.get('cost') <= self.get('pointsAvailable');
    });
  }.property('golfers.@each', 'pointsAvailable'),

  spent: function() {
    if ( this.get('golfers.length') === 0 ) { return 0; }

    return this.get('golfers').reduce(function(result, golfer) {
      return (result || 0) + golfer.get('cost');
    });
  }.property('golfers.@each.cost'),

  pointsAvailable: function() {
    return (50 - this.get('spent')) || 0;
  }.property('spent')
});

App.Bracket.FIXTURES = [
  { id: 'C2OkmPoiOe', golfers: [] }
];


