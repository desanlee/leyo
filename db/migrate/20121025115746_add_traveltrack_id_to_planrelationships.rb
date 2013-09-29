class AddTraveltrackIdToPlanrelationships < ActiveRecord::Migration
  def change
    add_column :planrelationships, :traveltrack_id, :integer
  end
end
