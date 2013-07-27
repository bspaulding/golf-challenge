class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha3
      t.string :alpha2

      t.timestamps
    end
  end
end
