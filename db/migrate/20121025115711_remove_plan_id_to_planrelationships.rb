class RemovePlanIdToPlanrelationships < ActiveRecord::Migration
  def up
    remove_column :planrelationships, :plan_id
  end

  def down
    add_column :planrelationships, :plan_id, :integer
  end
end
