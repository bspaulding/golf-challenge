App.AchievementsIndexController = Ember.ArrayController.extend({
  awardAchievement: function(achievement) {
    this.transitionToRoute('achievements.award', { achievement: achievement });
  }
});
