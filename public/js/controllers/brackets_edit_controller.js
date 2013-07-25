App.BracketsEditController = Ember.ObjectController.extend({
  addGolfer: function(golfer) {
    var bracketGolfer = App.BracketGolfer.createRecord({
      bracket: this.get('model.bracket'),
      golfer: golfer
    });
    bracketGolfer.get('store').commit();
  },

  removeGolfer: function(bracketGolfer) {
    bracketGolfer.deleteRecord();
    bracketGolfer.get('store').commit();
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

  availableBarStyle: function() {
    var percent = this.get('model.bracket.pointsAvailable') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.pointsAvailable'),

  spentBarStyle: function() {
    var percent = this.get('model.bracket.spent') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.spent')
});


