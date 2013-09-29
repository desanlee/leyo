class CreateTraveltracks < ActiveRecord::Migration
  def change
    create_table :traveltracks do |t|
      t.integer :plan_id
      t.string :startpoint
      t.string :terminal
      t.integer :positionindex

      t.timestamps
    end
  end
end
