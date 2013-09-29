class CreateFollowedlocales < ActiveRecord::Migration
  def change
    create_table :followedlocales do |t|
      t.integer :user_id
      t.integer :locale_id

      t.timestamps
    end
	add_index :followedlocales, [:user_id, :created_at]
  end
end
