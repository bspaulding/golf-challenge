App.BracketGolfer = DS.Model.extend({
  bracket: DS.belongsTo('App.Bracket'),
  golfer: DS.belongsTo('App.Golfer')
});
