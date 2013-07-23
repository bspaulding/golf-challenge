App.BracketsEditController = Ember.ObjectController.extend({
  saveBracket: function() {
    this.get('model.bracket.store').commit();
  },

  addGolfer: function(golfer) {
    this.get('model.bracket.golfers').addObject(golfer);
    this.saveBracket();
  },

  removeGolfer: function(golfer) {
    this.get('model.bracket.golfers').removeObject(golfer);
    this.saveBracket();
  },

  availableGolferFilter: '',
  availableGolfers: function() {
    var filter = this.get('availableGolferFilter').toLowerCase();
    var available = this.get('model.bracket.availableGolfers');
    if ( filter.length === 0 ) { return available; }

    return available.filter(function(golfer) {
      return golfer.get('name').toLowerCase().indexOf(filter) >= 0;
    });
  }.property('model.bracket.availableGolfers', 'availableGolferFilter'),

  selectedGolfers: function() {
    return this.get('model.bracket.golfers');
  }.property('model.bracket.golfers'),

  availableBarStyle: function() {
    var percent = this.get('model.bracket.pointsAvailable') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.pointsAvailable'),

  spentBarStyle: function() {
    var percent = this.get('model.bracket.spent') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.spent')
});


