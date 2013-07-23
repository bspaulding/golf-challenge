App.GolferAchievement = ParseModel.extend({
  golfer: DS.belongsTo('App.Golfer'),
  achievement: DS.belongsTo('App.Achievement')
});

App.GolferAchievement.FIXTURES = [
  { id: 1, golfer: 1, achievement: 1 }
];
