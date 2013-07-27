class AddCountryCodeToGolfer < ActiveRecord::Migration
  def change
    add_column :golfers, :country_code, :string
  end
end
