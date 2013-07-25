App.BracketGolfer = DS.Model.extend({
  bracket: DS.belongsTo('App.Bracket'),
  golfer: DS.belongsTo('App.Golfer')
});

App.BracketGolfer.FIXTURES = [
  { id: 1, bracket: 1, golfer: 4 }
];
