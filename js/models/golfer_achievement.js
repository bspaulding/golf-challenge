App.GolferAchievement = ParseModel.extend({
  golfer: DS.belongsTo('App.Golfer'),
  achievement: DS.belongsTo('App.Achievement'),
  pointsBinding: 'achievement.points',
  keyBinding: 'achievement.key',
  typeBinding: 'achievement.type'
});

App.GolferAchievement.FIXTURES = [
  { id: 1, golfer: 4, achievement: 1 },
  { id: 2, golfer: 4, achievement: 3 }
];
