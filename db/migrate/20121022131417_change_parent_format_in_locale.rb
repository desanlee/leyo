class ChangeParentFormatInLocale < ActiveRecord::Migration
  def up
	remove_index :locales, [:localetype, :parent, :created_at]
	change_column :locales, :parent, :string
  end

  def down
  end
end
