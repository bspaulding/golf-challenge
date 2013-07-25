App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('brackets.show', { bracket: App.Bracket.find('1') });
  }
});


