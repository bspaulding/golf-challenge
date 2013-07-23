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
  this.resource('achievements', function() {
    this.route('award', { path: '/:id/award' });
  });
  this.resource('brackets', function() {
    this.route('edit', { path: '/:id/edit' });
  });
});

