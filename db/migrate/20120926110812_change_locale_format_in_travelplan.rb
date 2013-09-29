class ChangeLocaleFormatInTravelplan < ActiveRecord::Migration
  def up
    remove_index :travelplans, [:owner, :locale, :created_at]
    change_column :travelplans, :locale, :string
  end

  def down
  end
end
