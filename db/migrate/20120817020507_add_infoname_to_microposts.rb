class AddInfonameToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :infoname, :string
  end
end
