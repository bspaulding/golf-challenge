class AddCountryIdToGolfer < ActiveRecord::Migration
  def change
    add_column :golfers, :country_id, :integer
  end
end
