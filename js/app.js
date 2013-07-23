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

