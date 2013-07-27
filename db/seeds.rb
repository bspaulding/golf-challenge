# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

golfers_attributes = JSON.parse('[{"rank":1,"name":"Tiger Woods","country_code":"USA"},{"rank":2,"name":"Phil Mickelson","country_code":"USA"},{"rank":3,"name":"Rory McIlroy","country_code":"Nir"},{"rank":4,"name":"Adam Scott","country_code":"Aus"},{"rank":5,"name":"Justin Rose","country_code":"Eng"},{"rank":6,"name":"Matt Kuchar","country_code":"USA"},{"rank":7,"name":"Brandt Snedeker","country_code":"USA"},{"rank":8,"name":"Graeme McDowell","country_code":"Nir"},{"rank":9,"name":"Luke Donald","country_code":"Eng"},{"rank":10,"name":"Lee Westwood","country_code":"Eng"},{"rank":11,"name":"Steve Stricker","country_code":"USA"},{"rank":12,"name":"Louis Oosthuizen","country_code":"Zaf"},{"rank":13,"name":"Charl Schwartzel","country_code":"Zaf"},{"rank":14,"name":"Ian Poulter","country_code":"Eng"},{"rank":15,"name":"Ernie Els","country_code":"Zaf"},{"rank":16,"name":"Sergio Garcia","country_code":"Esp"},{"rank":17,"name":"Keegan Bradley","country_code":"USA"},{"rank":18,"name":"Bubba Watson","country_code":"USA"},{"rank":19,"name":"Jason Day","country_code":"Aus"},{"rank":20,"name":"Henrik Stenson","country_code":"Swe"},{"rank":21,"name":"Webb Simpson","country_code":"USA"},{"rank":22,"name":"Hunter Mahan","country_code":"USA"},{"rank":23,"name":"Jason Dufner","country_code":"USA"},{"rank":24,"name":"Bill Haas","country_code":"USA"},{"rank":25,"name":"Dustin Johnson","country_code":"USA"},{"rank":26,"name":"Zach Johnson","country_code":"USA"},{"rank":27,"name":"Branden Grace","country_code":"Zaf"},{"rank":28,"name":"Matteo Manassero","country_code":"Ita"},{"rank":29,"name":"Nick Watney","country_code":"USA"},{"rank":30,"name":"Peter Hanson","country_code":"Swe"},{"rank":31,"name":"Bo Van Pelt","country_code":"USA"},{"rank":32,"name":"Jim Furyk","country_code":"USA"},{"rank":33,"name":"Richard Sterne","country_code":"Zaf"},{"rank":34,"name":"Hideki Matsuyama","country_code":"Jpn"},{"rank":35,"name":"Rickie Fowler","country_code":"USA"},{"rank":36,"name":"Martin Kaymer","country_code":"Deu"},{"rank":37,"name":"Francesco Molinari","country_code":"Ita"},{"rank":38,"name":"Billy Horschel","country_code":"USA"},{"rank":39,"name":"Jamie Donaldson","country_code":"Wal"},{"rank":40,"name":"Kevin Streelman","country_code":"USA"},{"rank":41,"name":"Thorbjorn Olesen","country_code":"Dnk"},{"rank":42,"name":"Nicolas Colsaerts","country_code":"Bel"},{"rank":43,"name":"Angel Cabrera","country_code":"Arg"},{"rank":44,"name":"Gonzalo Fdez-Castano","country_code":"Esp"},{"rank":45,"name":"Ryan Moore","country_code":"USA"},{"rank":46,"name":"Scott Piercy","country_code":"USA"},{"rank":47,"name":"Carl Pettersson","country_code":"Swe"},{"rank":48,"name":"Martin Laird","country_code":"Sco"},{"rank":49,"name":"Jonas Blixt","country_code":"Swe"},{"rank":50,"name":"Paul Lawrie","country_code":"Sco"}]')
golfers_attributes.each do |golfer_attributes|
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

