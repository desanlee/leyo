class ChangeParentFormatInMicropost < ActiveRecord::Migration
  def up
    change_column :microposts, :parent, :string
  end

  def down
  end
end

