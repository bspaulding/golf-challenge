class CreateBracketGolfers < ActiveRecord::Migration
  def change
    create_table :bracket_golfers do |t|
      t.integer :bracket_id
      t.integer :golfer_id

      t.timestamps
    end
  end
end
