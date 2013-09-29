class AddStartpointToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :startpoint, :string
  end
end
