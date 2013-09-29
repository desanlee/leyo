class AddPositionindexToPlanrelationships < ActiveRecord::Migration
  def change
    add_column :planrelationships, :positionindex, :integer
  end
end
