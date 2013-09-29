class CreateNoterelationships < ActiveRecord::Migration
  def change
    create_table :noterelationships do |t|
      t.integer :notetrack_id
      t.integer :micropost_id

      t.timestamps
    end
  end
end
