DS.RecordArray.reopen({
  isEmpty: function() { return Ember.isEmpty(this); }.property('length')
});

App = Ember.Application.create();

App.Store = DS.Store.extend({
  adapter: DS.RESTAdapter
});

App.Router.map(function() {
  this.resource('achievements', function() {
    this.route('award', { path: '/:id/award' });
  });
  this.resource('brackets', function() {
    this.route('show', { path: '/:id' });
    this.route('edit', { path: '/:id/edit' });
  });
});

