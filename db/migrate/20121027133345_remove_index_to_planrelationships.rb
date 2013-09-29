class RemoveIndexToPlanrelationships < ActiveRecord::Migration
  def up
	remove_index :planrelationships, [:plan_id, :micropost_id]
  end

  def down
  end
end
