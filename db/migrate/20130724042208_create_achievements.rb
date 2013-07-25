class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :key
      t.integer :points

      t.timestamps
    end
  end
end
