# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

golfers_attributes = JSON.parse('[{"id":4,"rank":1,"name":"Tiger Woods"},{"id":5,"rank":2,"name":"Rory McIlroy"},{"id":6,"rank":3,"name":"Justin Rose"},{"id":7,"rank":4,"name":"Adam Scott"},{"id":8,"rank":5,"name":"Phil Mickelson"},{"id":9,"rank":6,"name":"Matt Kuchar"},{"id":10,"rank":7,"name":"Graeme McDowell"},{"id":11,"rank":8,"name":"Brandt Snedeker"},{"id":12,"rank":9,"name":"Luke Donald"},{"id":13,"rank":10,"name":"Steve Stricker"},{"id":14,"rank":11,"name":"Louis Oosthuizen"},{"id":15,"rank":12,"name":"Lee Westwood"},{"id":16,"rank":13,"name":"Ernie Els"},{"id":17,"rank":14,"name":"Charl Schwartzel"},{"id":18,"rank":15,"name":"Sergio Garcia"},{"id":19,"rank":16,"name":"Bubba Watson"},{"id":20,"rank":17,"name":"Jason Day"},{"id":21,"rank":18,"name":"Keegan Bradley"},{"id":22,"rank":19,"name":"Webb Simpson"},{"id":23,"rank":20,"name":"Ian Poulter"},{"id":24,"rank":21,"name":"Jason Dufner"},{"id":25,"rank":22,"name":"Bill Haas"},{"id":26,"rank":23,"name":"Hunter Mahan"},{"id":27,"rank":24,"name":"Dustin Johnson"},{"id":28,"rank":25,"name":"Matteo Manassero"},{"id":29,"rank":26,"name":"Branden Grace"},{"id":30,"rank":27,"name":"Peter Hanson"},{"id":31,"rank":28,"name":"Nick Watney"},{"id":32,"rank":29,"name":"Zach Johnson"},{"id":33,"rank":30,"name":"Henrik Stenson"},{"id":34,"rank":31,"name":"Bo Van Pelt"},{"id":35,"rank":32,"name":"Jim Furyk"},{"id":36,"rank":33,"name":"Rickie Fowler"},{"id":37,"rank":34,"name":"Richard Sterne"},{"id":38,"rank":35,"name":"Martin Kaymer"},{"id":39,"rank":36,"name":"Billy Horschel"},{"id":40,"rank":37,"name":"Jamie Donaldson"},{"id":41,"rank":38,"name":"Kevin Streelman"},{"id":42,"rank":39,"name":"Thorbjorn Olesen"},{"id":43,"rank":40,"name":"Nicolas Colsaerts"},{"id":44,"rank":41,"name":"Gonzalo Fdez-Castano"},{"id":45,"rank":42,"name":"Francesco Molinari"},{"id":46,"rank":43,"name":"Scott Piercy"},{"id":47,"rank":44,"name":"Hideki Matsuyama"},{"id":48,"rank":45,"name":"Ryan Moore"},{"id":49,"rank":46,"name":"Carl Pettersson"},{"id":50,"rank":47,"name":"David Lynn"},{"id":51,"rank":48,"name":"Robert Garrigus"},{"id":52,"rank":49,"name":"Martin Laird"},{"id":53,"rank":50,"name":"Paul Lawrie"}]')
golfers_attributes.each do |golfer_attributes|
  golfer_attributes.delete("id")
  Golfer.find_or_create_by_name(golfer_attributes)
end

[
  { :points => 100, :key => 'tournament-1st-place-finish' },
  { :points => 50,  :key => 'tournament-2nd-place-finish' },
  { :points => 25,  :key => 'tournament-top-10-finish' },
  { :points => 25,  :key => 'single-day-leading-after-day' },
  { :points => 25,  :key => 'single-day-low-score-for-round' }
].each do |attributes|
  achievement = Achievement.find_or_create_by_key(attributes[:key])
  achievement.update_attributes(attributes)
end

