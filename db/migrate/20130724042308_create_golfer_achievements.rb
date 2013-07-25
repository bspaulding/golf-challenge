class CreateGolferAchievements < ActiveRecord::Migration
  def change
    create_table :golfer_achievements do |t|
      t.integer :golfer_id
      t.integer :achievement_id

      t.timestamps
    end
  end
end
