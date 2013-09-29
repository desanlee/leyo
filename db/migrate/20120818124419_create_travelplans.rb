class CreateTravelplans < ActiveRecord::Migration
  def change
    create_table :travelplans do |t|
      t.string :planname
      t.integer :owner
      t.integer :locale
      t.string :content

      t.timestamps
    end
	add_index :travelplans, [:owner, :locale, :created_at]
  end
end
