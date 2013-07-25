App.Achievement = DS.Model.extend({
  key: DS.attr('string'),
  points: DS.attr('number'),
  golferAchievements: DS.hasMany('App.GolferAchievement'),
  golfers: function() {
    return this.get('golferAchievements').mapProperty('golfer').uniq();
  }.property('golferAchievements.@each.golfer')
});

App.Achievement.FIXTURES = [
  { id: 1, key: 'tournament-1st-place-finish',    points: 100, golferAchievements: [1] },
  { id: 2, key: 'tournament-2nd-place-finish',    points: 50,  golferAchievements: []  },
  { id: 3, key: 'tournament-top-10-finish',       points: 25,  golferAchievements: [2] },
  { id: 4, key: 'single-day-leading-after-day',   points: 25,  golferAchievements: []  },
  { id: 5, key: 'single-day-low-score-for-round', points: 25,  golferAchievements: []  }
];
