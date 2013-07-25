class CreateGolferBrackets < ActiveRecord::Migration
  def change
    create_table :golfer_brackets do |t|
      t.integer :golfer_id
      t.integer :bracket_id

      t.timestamps
    end
  end
end
