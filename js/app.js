DS.RecordArray.reopen({
  isEmpty: function() { return Ember.isEmpty(this); }.property('length')
});

App = Ember.Application.create();

App.Store = DS.Store.extend({
  adapter: DS.FixtureAdapter
  // adapter: ParseAdapter.create({
  //   applicationId: 'RtuTUP4UioN4Jk51mMO3epOZbEI0pmHTdprFAL9n',
  //   javascriptId: 'j24CboJmqSeY1p4YELdyw7SCypWHA20VeH3eqGcL',
  //   restApiId: 'NMbhVqcUGUqb2tT1AhRE1HyzlMCSEhdLoJyNbMBv'
  // })
});

App.Router.map(function() {
  this.resource('brackets', function() {
    this.route('edit', { path: '/:id/edit' });
  });
});

App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('brackets.edit', { bracket: App.Bracket.find('C2OkmPoiOe') });
  }
});

App.BracketsEditRoute = Ember.Route.extend({
  setupController: function(controller, model) {
    // not sure why this is necessary,
    // but App.Golfer doesn't seem to load if not.
    App.Golfer.find();

    controller.set('model', model);
  },

  model: function(params) {
    return { bracket: App.Bracket.find(params.id) };
  },

  serialize: function(object) {
    return { id: object.bracket.id };
  }
});

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

