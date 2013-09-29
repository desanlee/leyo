class ChangeEndpointFormatInMicropost < ActiveRecord::Migration
  def up
	change_column :microposts, :endpoint, :string
  end

  def down
  end
end
