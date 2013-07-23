App.AchievementsAwardRoute = Ember.Route.extend({
  model: function(params) {
    return {
      achievement: App.Achievement.find(params.id),
      golfers: App.Golfer.find()
    }
  },

  setupController: function(controller, model) {
    if ( !model.golfers ) {
      // we've come here with a preloaded achievement object, need to mimic 'model' hook
      model.golfers = App.Golfer.find();
    }

    controller.set('model', model);
  },

  serialize: function(object) {
    return { id: object.achievement.id };
  },

  renderTemplate: function() {
    this.render({ into: 'application' });
  }
});
