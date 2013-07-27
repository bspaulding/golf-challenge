# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

seed_data_dir = File.join(Rails.root, 'db', 'seed_data')

countries_attributes = JSON.parse(File.read(File.join(seed_data_dir, 'countries.json')))
countries_attributes.each do |country_attributes|
  country = Country.find_or_create_by_alpha3(country_attributes)
  country.update_attributes!(country_attributes)
end

golfers_attributes = JSON.parse(File.read(File.join(seed_data_dir, 'golfers.json')))
golfers_attributes.each do |golfer_attributes|
  country_code = golfer_attributes.delete("country_code").upcase
  golfer = Golfer.find_or_create_by_name(golfer_attributes)
  country = Country.find_by_alpha3(country_code)
  if country
    golfer.country = country
    golfer.save!
  else
    raise ActiveRecord::RecordNotFound.new("Couldn't find Country with alpha3 code: '#{country_code}'")
  end
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

