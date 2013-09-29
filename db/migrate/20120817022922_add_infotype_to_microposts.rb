class AddInfotypeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :infotype, :string
  end
end
