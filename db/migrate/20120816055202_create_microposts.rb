class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :type
      t.integer :owner
      t.integer :parent
      t.integer :endpoint
      t.string :content

      t.timestamps
    end
	add_index :microposts, [:owner, :parent, :created_at]
  end
end
