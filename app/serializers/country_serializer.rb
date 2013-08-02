class CountrySerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids

  attributes :id, :name, :alpha2, :alpha3

  has_many :golfers
end
