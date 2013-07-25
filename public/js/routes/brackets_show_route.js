App.BracketsShowRoute = Ember.Route.extend({
  model: function(params) {
    return { bracket: App.Bracket.find(params.id) };
  },

  serialize: function(object) {
    return { id: object.bracket.id };
  }
});


