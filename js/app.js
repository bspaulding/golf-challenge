DS.RecordArray.reopen({
  isEmpty: function() { return Ember.isEmpty(this); }.property('length')
});

App = Ember.Application.create();

App.Store = DS.Store.extend({
  adapter: ParseAdapter.create({
    applicationId: 'RtuTUP4UioN4Jk51mMO3epOZbEI0pmHTdprFAL9n',
    javascriptId: 'j24CboJmqSeY1p4YELdyw7SCypWHA20VeH3eqGcL',
    restApiId: 'NMbhVqcUGUqb2tT1AhRE1HyzlMCSEhdLoJyNbMBv'
  })
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return {
      bracket: App.Bracket.find('C2OkmPoiOe'),
      availableGolfers: App.Golfer.find()
    };
  }
});

App.IndexController = Ember.ObjectController.extend({
  saveBracket: function() {
    this.get('model.bracket.store').commit();
  },

  addGolfer: function(golfer) {
    this.get('model.bracket.golfers').addObject(golfer);
    this.saveBracket();
  },

  removeGolfer: function(golfer) {
    this.get('model.bracket.golfers').removeObject(golfer);
    this.saveBracket();
  },

  availableGolferFilter: '',
  availableGolfers: function() {
    var filter = this.get('availableGolferFilter').toLowerCase();
    var available = this.get('model.bracket.availableGolfers');
    if ( filter.length === 0 ) { return available; }

    return available.filter(function(golfer) {
      return golfer.get('name').toLowerCase().indexOf(filter) >= 0;
    });
  }.property('model.bracket.availableGolfers', 'availableGolferFilter'),

  selectedGolfers: function() {
    return this.get('model.bracket.golfers');
  }.property('model.bracket.golfers'),

  availableBarStyle: function() {
    var percent = this.get('model.bracket.pointsAvailable') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.pointsAvailable'),

  spentBarStyle: function() {
    var percent = this.get('model.bracket.spent') / 50 * 100
    return 'width:' + percent + '%';
  }.property('model.bracket.spent')
});

App.Bracket = ParseModel.extend({
  golfers: DS.hasMany('App.Golfer'),

  availableGolfers: function() {
    var self = this;
    return App.Golfer.filter(function(golfer) {
      return self.get('golfers').mapProperty('id').indexOf(golfer.get('id')) < 0
          && golfer.get('cost') <= self.get('pointsAvailable');
    });
  }.property('golfers.@each', 'pointsAvailable'),

  spent: function() {
    if ( this.get('golfers.length') === 0 ) { return 0; }

    return this.get('golfers').reduce(function(result, golfer) {
      return (result || 0) + golfer.get('cost');
    });
  }.property('golfers.@each.cost'),

  pointsAvailable: function() {
    return (50 - this.get('spent')) || 0;
  }.property('spent')
});

App.Bracket.FIXTURES = [
  { id: 1, golfers: [] }
];

App.Golfer = ParseModel.extend({
  name: DS.attr('string'),
  rank: DS.attr('number'),
  cost: function() {
    var rank = this.get('rank');

    if ( rank > 45 ) { return 5;  }
    if ( rank > 30 ) { return 10; }
    if ( rank > 15 ) { return 15; }

    return 20;
  }.property('rank').cacheable()
});

App.Golfer.FIXTURES = [{"id":4,"rank":1,"name":"Tiger Woods"},{"id":5,"rank":2,"name":"Rory McIlroy"},{"id":6,"rank":3,"name":"Justin Rose"},{"id":7,"rank":4,"name":"Adam Scott"},{"id":8,"rank":5,"name":"Phil Mickelson"},{"id":9,"rank":6,"name":"Matt Kuchar"},{"id":10,"rank":7,"name":"Graeme McDowell"},{"id":11,"rank":8,"name":"Brandt Snedeker"},{"id":12,"rank":9,"name":"Luke Donald"},{"id":13,"rank":10,"name":"Steve Stricker"},{"id":14,"rank":11,"name":"Louis Oosthuizen"},{"id":15,"rank":12,"name":"Lee Westwood"},{"id":16,"rank":13,"name":"Ernie Els"},{"id":17,"rank":14,"name":"Charl Schwartzel"},{"id":18,"rank":15,"name":"Sergio Garcia"},{"id":19,"rank":16,"name":"Bubba Watson"},{"id":20,"rank":17,"name":"Jason Day"},{"id":21,"rank":18,"name":"Keegan Bradley"},{"id":22,"rank":19,"name":"Webb Simpson"},{"id":23,"rank":20,"name":"Ian Poulter"},{"id":24,"rank":21,"name":"Jason Dufner"},{"id":25,"rank":22,"name":"Bill Haas"},{"id":26,"rank":23,"name":"Hunter Mahan"},{"id":27,"rank":24,"name":"Dustin Johnson"},{"id":28,"rank":25,"name":"Matteo Manassero"},{"id":29,"rank":26,"name":"Branden Grace"},{"id":30,"rank":27,"name":"Peter Hanson"},{"id":31,"rank":28,"name":"Nick Watney"},{"id":32,"rank":29,"name":"Zach Johnson"},{"id":33,"rank":30,"name":"Henrik Stenson"},{"id":34,"rank":31,"name":"Bo Van Pelt"},{"id":35,"rank":32,"name":"Jim Furyk"},{"id":36,"rank":33,"name":"Rickie Fowler"},{"id":37,"rank":34,"name":"Richard Sterne"},{"id":38,"rank":35,"name":"Martin Kaymer"},{"id":39,"rank":36,"name":"Billy Horschel"},{"id":40,"rank":37,"name":"Jamie Donaldson"},{"id":41,"rank":38,"name":"Kevin Streelman"},{"id":42,"rank":39,"name":"Thorbjorn Olesen"},{"id":43,"rank":40,"name":"Nicolas Colsaerts"},{"id":44,"rank":41,"name":"Gonzalo Fdez-Castano"},{"id":45,"rank":42,"name":"Francesco Molinari"},{"id":46,"rank":43,"name":"Scott Piercy"},{"id":47,"rank":44,"name":"Hideki Matsuyama"},{"id":48,"rank":45,"name":"Ryan Moore"},{"id":49,"rank":46,"name":"Carl Pettersson"},{"id":50,"rank":47,"name":"David Lynn"},{"id":51,"rank":48,"name":"Robert Garrigus"},{"id":52,"rank":49,"name":"Martin Laird"},{"id":53,"rank":50,"name":"Paul Lawrie"}]

