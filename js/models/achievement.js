App.Achievement = ParseModel.extend({
  key: DS.attr('string'),
  type: DS.attr('string'),
  points: DS.attr('number')
});

App.Achievement.FIXTURES = [
  { id: 1, type: 'tournament', key: '1st-place-finish',    points: 100 },
  { id: 2, type: 'tournament', key: '2nd-place-finish',    points: 50  },
  { id: 3, type: 'tournament', key: 'top-10-finish',       points: 25  },
  { id: 4, type: 'single-day', key: 'leading-after-day',   points: 25  },
  { id: 5, type: 'single-day', key: 'low-score-for-round', points: 25  }
];
