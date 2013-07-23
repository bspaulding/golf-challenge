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


