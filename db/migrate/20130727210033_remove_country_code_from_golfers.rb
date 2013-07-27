class RemoveCountryCodeFromGolfers < ActiveRecord::Migration
  def change
    remove_column :golfers, :country_code
  end
end
