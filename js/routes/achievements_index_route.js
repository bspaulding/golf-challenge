App.AchievementsIndexRoute = Ember.Route.extend({
  model: function() {
    return App.Achievement.find();
  }
});

