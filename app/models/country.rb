class Country < ActiveRecord::Base
  include CacheableModel

  has_many :golfers
end
