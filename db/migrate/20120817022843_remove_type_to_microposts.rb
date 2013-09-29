class RemoveTypeToMicroposts < ActiveRecord::Migration
  def up
    remove_column :microposts, :name
  end

  def down
    add_column :microposts, :name, :string
  end
end
