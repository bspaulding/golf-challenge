module CacheableModel
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def all_cached
      Rails.cache.fetch(all_cache_key) { all }
    end

    def all_cache_key
      "#{table_name}/all-#{count}-#{maximum(:updated_at).try(:utc).try(:to_s, :number)}"
    end
  end
end
