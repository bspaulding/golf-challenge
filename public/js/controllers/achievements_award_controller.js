App.AchievementsAwardController = Ember.ObjectController.extend({
  selectedGolfer: null,
  award: function() {
    // Ember.Select isn't updating the selectionBinding when the promise is fulfilled. :/
    // This ensures that we get a golfer if the user never changes the select value.
    if ( !this.get('selectedGolfer') || this.get('selectedGolfer').contructor !== App.Golfer ) {
      $('select').trigger('change');
    }

    var golferAchievement = App.GolferAchievement.createRecord({
      golfer: this.get('selectedGolfer'),
      achievement: this.get('model.achievement')
    });
    golferAchievement.get('store').commit();

    this.transitionToRoute('achievements.index');
  }
});
