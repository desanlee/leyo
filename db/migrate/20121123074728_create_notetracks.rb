class CreateNotetracks < ActiveRecord::Migration
  def change
    create_table :notetracks do |t|
      t.integer :note_id
      t.string :startpoint
      t.string :terminal
      t.integer :positionindex

      t.timestamps
    end
  end
end
