class CreatePlanrelationships < ActiveRecord::Migration
  def change
    create_table :planrelationships do |t|
      t.integer :plan_id
      t.integer :micropost_id

      t.timestamps
    end
	
	add_index :planrelationships, :plan_id
	add_index :planrelationships, :micropost_id
	add_index :planrelationships, [:plan_id, :micropost_id], unique: true
  end
end
