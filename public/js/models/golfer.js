App.Golfer = DS.Model.extend({
  name: DS.attr('string'),
  rank: DS.attr('number'),
  country: DS.belongsTo('App.Country'),
  golferAchievements: DS.hasMany('App.GolferAchievement'),
  cost: function() {
    var rank = this.get('rank');

    if ( rank > 45 ) { return 5;  }
    if ( rank > 30 ) { return 10; }
    if ( rank > 15 ) { return 15; }

    return 20;
  }.property('rank').cacheable(),
  score: function() {
    return this.get('golferAchievements').mapProperty('points').reduce(function(result, points) {
      return result + (parseInt(points) || 0);
    }, 0);
  }.property('golferAchievements.@each.points')
});

App.Golfer.FIXTURES = [
  {"id":4,"rank":1,"name":"Tiger Woods", "golferAchievements": [1,2] },
  {"id":5,"rank":2,"name":"Rory McIlroy"},{"id":6,"rank":3,"name":"Justin Rose"},{"id":7,"rank":4,"name":"Adam Scott"},{"id":8,"rank":5,"name":"Phil Mickelson"},{"id":9,"rank":6,"name":"Matt Kuchar"},{"id":10,"rank":7,"name":"Graeme McDowell"},{"id":11,"rank":8,"name":"Brandt Snedeker"},{"id":12,"rank":9,"name":"Luke Donald"},{"id":13,"rank":10,"name":"Steve Stricker"},{"id":14,"rank":11,"name":"Louis Oosthuizen"},{"id":15,"rank":12,"name":"Lee Westwood"},{"id":16,"rank":13,"name":"Ernie Els"},{"id":17,"rank":14,"name":"Charl Schwartzel"},{"id":18,"rank":15,"name":"Sergio Garcia"},{"id":19,"rank":16,"name":"Bubba Watson"},{"id":20,"rank":17,"name":"Jason Day"},{"id":21,"rank":18,"name":"Keegan Bradley"},{"id":22,"rank":19,"name":"Webb Simpson"},{"id":23,"rank":20,"name":"Ian Poulter"},{"id":24,"rank":21,"name":"Jason Dufner"},{"id":25,"rank":22,"name":"Bill Haas"},{"id":26,"rank":23,"name":"Hunter Mahan"},{"id":27,"rank":24,"name":"Dustin Johnson"},{"id":28,"rank":25,"name":"Matteo Manassero"},{"id":29,"rank":26,"name":"Branden Grace"},{"id":30,"rank":27,"name":"Peter Hanson"},{"id":31,"rank":28,"name":"Nick Watney"},{"id":32,"rank":29,"name":"Zach Johnson"},{"id":33,"rank":30,"name":"Henrik Stenson"},{"id":34,"rank":31,"name":"Bo Van Pelt"},{"id":35,"rank":32,"name":"Jim Furyk"},{"id":36,"rank":33,"name":"Rickie Fowler"},{"id":37,"rank":34,"name":"Richard Sterne"},{"id":38,"rank":35,"name":"Martin Kaymer"},{"id":39,"rank":36,"name":"Billy Horschel"},{"id":40,"rank":37,"name":"Jamie Donaldson"},{"id":41,"rank":38,"name":"Kevin Streelman"},{"id":42,"rank":39,"name":"Thorbjorn Olesen"},{"id":43,"rank":40,"name":"Nicolas Colsaerts"},{"id":44,"rank":41,"name":"Gonzalo Fdez-Castano"},{"id":45,"rank":42,"name":"Francesco Molinari"},{"id":46,"rank":43,"name":"Scott Piercy"},{"id":47,"rank":44,"name":"Hideki Matsuyama"},{"id":48,"rank":45,"name":"Ryan Moore"},{"id":49,"rank":46,"name":"Carl Pettersson"},{"id":50,"rank":47,"name":"David Lynn"},{"id":51,"rank":48,"name":"Robert Garrigus"},{"id":52,"rank":49,"name":"Martin Laird"},{"id":53,"rank":50,"name":"Paul Lawrie"}]


