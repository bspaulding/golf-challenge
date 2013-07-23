App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('brackets.edit', { bracket: App.Bracket.find('C2OkmPoiOe') });
  }
});


